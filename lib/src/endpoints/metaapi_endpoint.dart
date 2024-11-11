import 'package:serverpod/serverpod.dart';
import 'package:tradelog_server/src/clients/metaapi_client.dart';
import 'package:tradelog_server/src/generated/protocol.dart';
import 'package:tradelog_server/src/util/configuration.dart';

class MetaApiEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  late MetaApiClient client;

  /// Initializes the MetaApiClient using an access token from the session cache.
  /// If no access token is found, retrieves it from the linked account.
  /// Throws an exception if no linked account is found or if there's an error during initialization.
  Future<void> initializeClient(Session session, {int accNum = -1}) async {
    var authenticated = await session.authenticated;
    var accessToken = await session.caches.localPrio
        .get<AccessToken>('metatrader-${authenticated!.userId}');

    if (accessToken != null) {
      client = MetaApiClient(
        Configuration.metaApiURILN,
        accessToken.token,
      );
      return;
    }

    var linkedAccount = await LinkedAccount.db.findFirstRow(
      session,
      where: (o) =>
          o.userInfoId.equals(authenticated.userId) &
          o.platform.equals(Platform.Metatrader),
    );

    if (linkedAccount == null) {
      throw Exception('Access token not found in cache/No account linked');
    }

    accessToken = AccessToken(token: linkedAccount.apiKey);

    await session.caches.localPrio
        .put('metatrader-${authenticated.userId}', accessToken);

    client = MetaApiClient(
      Configuration.metaApiURILN,
      accessToken.token,
    );
  }

  /// Authenticates the user by storing the provided API key and linking it to the user's account.
  /// If a linked account exists, it updates the API key. Otherwise, it inserts a new linked account.
  /// Caches the access token after authentication.
  Future<void> authenticate(
    Session session,
    String apiKey,
    String metaId, {
    String? title,
  }) async {
    var authenticated = await session.authenticated;
    var accessToken = AccessToken(token: apiKey);

    // Check if a linked account exists for this user on the MetaTrader platform
    LinkedAccount? checkLinked;
    try {
      checkLinked = await LinkedAccount.db.findFirstRow(
        session,
        where: (o) =>
            o.userInfoId.equals(authenticated!.userId) &
            o.platform.equals(Platform.Metatrader),
      );
    } catch (e) {
      throw Exception(
          'Database error while checking linked account - Error: $e');
    }

    // Insert or update the linked account, setting the metaId
    try {
      if (checkLinked == null) {
        var linkedAccount = LinkedAccount(
          userInfoId: authenticated!.userId,
          apiKey: apiKey,
          // TODO: check refresh token logic with METAPI
          refreshToken: "",
          platform: Platform.Metatrader,
          metaID: metaId,
          // Set the metaId here
          title: title,
        );
        await LinkedAccount.db.insertRow(session, linkedAccount);
      } else {
        checkLinked.apiKey = apiKey;
        checkLinked.metaID =
            metaId; // Update the metaId here if it already exists
        checkLinked.title = title;
        await LinkedAccount.db.updateRow(session, checkLinked);
      }
    } catch (e) {
      throw Exception(
          'Database error while inserting/updating linked account - Error: $e');
    }

    // Cache the access token
    try {
      await session.caches.localPrio
          .put('metatrader-${authenticated!.userId}', accessToken);
    } catch (e) {
      throw Exception('Error caching access token - Error: $e');
    }
  }

  /// Retrieves the account information for the specified MetaTrader account.
  /// Initializes the MetaApiClient if not already initialized.
  /// Returns a [MetaTradingAccountInformation] object if successful, otherwise throws an exception.
  Future<MetaTradingAccountInformation> getAccountInformation(
      Session session, String accountId) async {
    await initializeClient(session);

    final response = await client
        .get('/users/current/accounts/$accountId/account-information');
    if (response.statusCode == 200) {
      try {
        return MetaTradingAccountInformation.fromJson(response.data);
      } catch (e) {
        throw Exception('Failed to parse account information - Error: $e');
      }
    } else {
      throw Exception(
          'Failed to fetch account information - Error code: ${response.statusCode}');
    }
  }

  /// Retrieves the list of open positions for the specified MetaTrader account.
  /// Initializes the MetaApiClient if not already initialized.
  /// Returns a list of [MetatraderPosition] objects if successful, otherwise throws an exception.
  Future<List<MetatraderPosition>> getPositions(
      Session session, String accountId) async {
    await initializeClient(session);

    final response =
        await client.get('/users/current/accounts/$accountId/positions');
    if (response.statusCode == 200) {
      print(response.data);
      return List<MetatraderPosition>.from(
          response.data.map((x) => MetatraderPosition.fromJson(x)));
    } else {
      throw Exception(
          'Failed to fetch positions - Error code: ${response.statusCode}');
    }
  }

  Future<List<TradeDto>> getTrades(Session session, String accountId) async {
    await initializeClient(session);

    // Fetch orders for the specified account within a date range
    final orderResponse = await client.get(
        '/users/current/accounts/$accountId/history-orders/time/:${DateTime(2021)}/:${DateTime.now()}');

    if (orderResponse.statusCode == 200) {
      // Convert response data to a list of MetatraderOrder objects
      var orders = List<MetatraderOrder>.from(
          orderResponse.data.map((x) => MetatraderOrder.fromJson(x)));

      // Group orders by positionId
      Map<String, List<MetatraderOrder>> ordersByPosition = {};
      for (var order in orders) {
        ordersByPosition.putIfAbsent(order.positionId!, () => []).add(order);
      }

      // Calculate net profit/loss and convert to DisplayTrade objects
      var displayTrades = <TradeDto>[];
      for (var entry in ordersByPosition.entries) {
        var positionOrders = entry.value;

        double netpl = 0.0;
        double netroi = 0.0;

        // Process orders in pairs to calculate netpl based on buy/sell price differences
        for (var i = 0; i < positionOrders.length - 1; i++) {
          var buyOrder = positionOrders[i];
          var sellOrder = positionOrders[i + 1];

          // Calculate profit/loss only if we have a BUY followed by a SELL
          if (buyOrder.type == 'ORDER_TYPE_BUY' &&
              sellOrder.type == 'ORDER_TYPE_SELL') {
            netpl +=
                (sellOrder.openPrice! - buyOrder.openPrice!) * buyOrder.volume;
            double investment = buyOrder.openPrice! * buyOrder.volume;
            netroi += investment != 0 ? (netpl / investment) * 100 : 0.0;
          }
        }

        // Use the first order as the basis for DisplayTrade properties
        var baseOrder = positionOrders.first;

        // displayTrades.add(
        //   TradeExtension.fromMetaTrader(),
        // );
      }

      return displayTrades;
    } else {
      throw Exception(
          'Failed to fetch order history - Error code: ${orderResponse.statusCode}');
    }
  }

  /// Retrieves the list of open orders for the specified MetaTrader account.
  /// Initializes the MetaApiClient if not already initialized.
  /// Returns a list of [MetatraderOrder] objects if successful, otherwise throws an exception.
  Future<List<MetatraderOrder>> getOrders(
      Session session, String accountId) async {
    await initializeClient(session);

    final response = await client.get(
        '/users/current/accounts/$accountId/history-orders/time/:${DateTime(2021)}/:${DateTime.now()}');
    if (response.statusCode == 200) {
      return List<MetatraderOrder>.from(
          response.data.map((x) => MetatraderOrder.fromJson(x)));
    } else {
      throw Exception(
          'Failed to fetch orders - Error code: ${response.statusCode}');
    }
  }

  /// Retrieves the history of orders for the specified MetaTrader account within the given time range.
  /// Initializes the MetaApiClient if not already initialized.
  /// Returns the history orders as a string if successful, otherwise throws an exception.
  Future<String> getHistoryOrdersByTime(Session session, String accountId,
      String startTime, String endTime) async {
    await initializeClient(session);

    final response = await client.get(
        '/users/current/accounts/$accountId/history-orders/time/$startTime/$endTime');
    if (response.statusCode == 200) {
      return response.data.toString();
    } else {
      throw Exception(
          'Failed to fetch history orders - Error code: ${response.statusCode}');
    }
  }
}
