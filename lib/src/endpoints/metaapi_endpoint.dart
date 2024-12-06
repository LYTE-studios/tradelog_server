// import 'package:collection/collection.dart';
// import 'package:serverpod/serverpod.dart';
// import 'package:tradelog_server/src/clients/metaapi_client.dart';
// import 'package:tradelog_server/src/exceptions/general_tradely_exception.dart';
// import 'package:tradelog_server/src/extensions/trade_extension.dart';
// import 'package:tradelog_server/src/generated/protocol.dart';
// import 'package:tradelog_server/src/util/configuration.dart';

// class MetaApiEndpoint extends Endpoint {
//   @override
//   bool get requireLogin => true;

//   late MetaApiClient client;

//   /// Authenticates the user by storing the provided API key and linking it to the user's account.
//   /// If a linked account exists, it updates the API key. Otherwise, it inserts a new linked account.
//   /// Caches the access token after authentication.
//   Future<void> authenticate(
//     Session session, {
//     String? title,
//     required String server,
//     required String login,
//     required String password,
//     required String platform,
//   }) async {
//     var authenticated = await session.authenticated;

//     // Insert or update the linked account, setting the metaId
//     // try {
//     //   var linkedAccount = LinkedAccount(
//     //     userInfoId: authenticated!.userId,
//     //     apiKey: apiKey,
//     //     apiUrl: Configuration.metaApiURILN,
//     //     // TODO: check refresh token logic with METAPI
//     //     refreshToken: "",
//     //     platform: Platform.Metatrader,
//     //     metaID: metaId,
//     //     // Set the metaId here
//     //     title: title,
//     //   );
//     //   await LinkedAccount.db.insertRow(session, linkedAccount);
//     // } catch (e) {
//     //   throw Exception(
//     //       'Database error while inserting/updating linked account - Error: $e');
//     // }
//   }

//   /// Retrieves the account information for the specified MetaTrader account.
//   /// Initializes the MetaApiClient if not already initialized.
//   /// Returns a [MetaTradingAccountInformation] object if successful, otherwise throws an exception.
//   Future<MetaTradingAccountInformation> getAccountInformation(
//       Session session, String accountId) async {
//     await initializeClient(session);

//     final response = await client
//         .get('/users/current/accounts/$accountId/account-information');
//     if (response.statusCode == 200) {
//       try {
//         return MetaTradingAccountInformation.fromJson(response.data);
//       } catch (e) {
//         throw Exception('Failed to parse account information - Error: $e');
//       }
//     } else {
//       throw Exception(
//           'Failed to fetch account information - Error code: ${response.statusCode}');
//     }
//   }

//   /// Retrieves the list of open positions for the specified MetaTrader account.
//   /// Initializes the MetaApiClient if not already initialized.
//   /// Returns a list of [MetatraderPosition] objects if successful, otherwise throws an exception.
//   Future<List<MetatraderPosition>> getPositions(
//       Session session, String accountId) async {
//     final response =
//         await client.get('/users/current/accounts/$accountId/positions');
//     if (response.statusCode == 200) {
//       print(response.data);
//       return List<MetatraderPosition>.from(
//           response.data.map((x) => MetatraderPosition.fromJson(x)));
//     } else {
//       throw Exception(
//           'Failed to fetch positions - Error code: ${response.statusCode}');
//     }
//   }

//   Future<List<TradeDto>> getAllTrades(
//     Session session, {
//     DateTime? from,
//     DateTime? to,
//   }) async {
//     var authenticated = await session.authenticated;

//     if (authenticated == null) {
//       throw GeneralTradelyException('User not authenticated');
//     }

//     var trades = <TradeDto>[];

//     var linkedAccounts = await LinkedAccount.db.find(
//       session,
//       where: (o) =>
//           o.userInfoId.equals(authenticated.userId) &
//           o.platform.equals(Platform.Metatrader),
//     );

//     for (var account in linkedAccounts) {
//       try {
//         var metaTrades = await getTrades(
//           session,
//           accountId: account.metaID!,
//           from: from,
//           to: to,
//         );

//         trades.addAll(metaTrades);
//       } catch (e) {
//         session.log('Error fetching trades from MetaTrader: $e');
//       }
//     }

//     return trades;
//   }

//   Future<List<TradeDto>> getTrades(
//     Session session, {
//     required String accountId,
//     DateTime? from,
//     DateTime? to,
//   }) async {
//     await initializeClient(session);

//     List<MetatraderPosition> positions = await getPositions(session, accountId);

//     // Fetch orders for the specified account
//     final orderResponse = await client.get(
//       '/users/current/accounts/$accountId/history-orders/time/${from ?? DateTime(2021)}/${to ?? DateTime.now()}',
//     );

//     if (orderResponse.statusCode != 200) {
//       throw Exception(
//           'Failed to fetch order history - Error code: ${orderResponse.statusCode}');
//     }

//     // Convert response data to a list of MetatraderOrder objects
//     List<MetatraderOrder> orders = List<MetatraderOrder>.from(
//       orderResponse.data.map((x) => MetatraderOrder.fromJson(x)),
//     );

//     // Group orders by positionId
//     Map<MetatraderPosition, List<MetatraderOrder>> groupedOrders =
//         _groupOrdersByPosition(
//       orders,
//       positions,
//     );

//     // Convert grouped orders into TradeDto objects
//     final List<TradeDto> trades = [];

//     for (MapEntry<MetatraderPosition, List<MetatraderOrder>> entry
//         in groupedOrders.entries) {
//       MetatraderPosition position = entry.key;
//       List<MetatraderOrder> positionOrders = entry.value;

//       // Sort orders chronologically for each position
//       positionOrders.sort((a, b) => a.doneTime!.compareTo(b.doneTime!));

//       // Calculate hold time (difference between the first and last order)
//       double holdTime = positionOrders.last.doneTime!
//           .difference(positionOrders.first.doneTime!)
//           .inMinutes
//           .toDouble();

//       // Use the first order as the base for TradeDto
//       MetatraderOrder? firstOrder = positionOrders.firstOrNull;

//       if (firstOrder == null) {
//         continue;
//       }

//       // Create TradeDto using the first order
//       TradeDto dto = TradeExtension.fromMetaTraderOrder(firstOrder, position);

//       // Set the calculated hold time
//       dto.holdTime = holdTime;

//       trades.add(dto);
//     }

//     return trades;
//   }

//   Map<MetatraderPosition, List<MetatraderOrder>> _groupOrdersByPosition(
//     List<MetatraderOrder> orders,
//     List<MetatraderPosition> positions,
//   ) {
//     final Map<MetatraderPosition, List<MetatraderOrder>> ordersByPosition = {};

//     for (var order in orders) {
//       if (order.positionId != null) {
//         MetatraderPosition? position = positions.firstWhereOrNull(
//           (e) => e.id == order.positionId,
//         );

//         if (position == null) {
//           continue;
//         }

//         ordersByPosition[position] = [
//           ...(ordersByPosition[position] ?? []),
//           order
//         ];
//       }
//     }

//     return ordersByPosition;
//   }

//   /// Retrieves the list of open orders for the specified MetaTrader account.
//   /// Initializes the MetaApiClient if not already initialized.
//   /// Returns a list of [MetatraderOrder] objects if successful, otherwise throws an exception.
//   Future<List<MetatraderOrder>> getOrders(
//       Session session, String accountId) async {
//     await initializeClient(session);

//     final response = await client.get(
//         '/users/current/accounts/$accountId/history-orders/time/:${DateTime(2021)}/:${DateTime.now()}');
//     if (response.statusCode == 200) {
//       return List<MetatraderOrder>.from(
//           response.data.map((x) => MetatraderOrder.fromJson(x)));
//     } else {
//       throw Exception(
//           'Failed to fetch orders - Error code: ${response.statusCode}');
//     }
//   }

//   /// Retrieves the history of orders for the specified MetaTrader account within the given time range.
//   /// Initializes the MetaApiClient if not already initialized.
//   /// Returns the history orders as a string if successful, otherwise throws an exception.
//   Future<String> getHistoryOrdersByTime(Session session, String accountId,
//       String startTime, String endTime) async {
//     await initializeClient(session);

//     final response = await client.get(
//         '/users/current/accounts/$accountId/history-orders/time/$startTime/$endTime');
//     if (response.statusCode == 200) {
//       return response.data.toString();
//     } else {
//       throw Exception(
//           'Failed to fetch history orders - Error code: ${response.statusCode}');
//     }
//   }
// }
