import 'dart:io';

import 'package:serverpod/serverpod.dart';
import 'package:tradelog_server/src/endpoints/metaapi_endpoint.dart';
import 'package:tradelog_server/src/endpoints/tradelocker_endpoint.dart';
import 'package:tradelog_server/src/exceptions/general_tradely_exception.dart';
import 'package:tradelog_server/src/generated/protocol.dart';

class GlobalEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Gets the trades from a session
  /// If the trades are already stored in cache, they get pulled from the session cache
  /// If they are not, they get fetched from their respective API's
  Future<List<TradeDto>> getTrades(
    Session session, {
    DateTime? from,
    DateTime? to,
  }) async {
    List<TradeDto>? cachedTrades = await _getCachedTrades(session);

    if (cachedTrades == null) {
      List<TradeDto> trades = await _fetchFromAPIs(session);

      await _setCachedTrades(session, trades);

      cachedTrades = trades;
    }

    if (from != null && to != null) {
      return cachedTrades
          .where(
            (e) => e.openTime.isAfter(from) && e.openTime.isBefore(to),
          )
          .toList();
    }

    return cachedTrades;
  }

  /// Fetches the cached trades. Returns [null] if none are found
  static Future<List<TradeDto>?> _getCachedTrades(
    Session session,
  ) async {
    var authenticated = await session.authenticated;

    TradeListDto? dto = await session.caches.localPrio.get<TradeListDto>(
      'trades-${authenticated!.userId}',
    );

    return dto?.trades;
  }

  /// Sets the cached trades to the serverpod cache
  static Future<void> _setCachedTrades(
    Session session,
    List<TradeDto> trades,
  ) async {
    var authenticated = await session.authenticated;

    assert(authenticated != null);

    // Convert each DisplayTrade to JSON and store the JSON list in the cache
    // Wrap the trades in DisplayTradeList and store in the cache
    var tradeListWrapper = TradeListDto(trades: trades);

    await session.caches.localPrio.put(
      'trades-${authenticated!.userId}',
      tradeListWrapper,
      lifetime: Duration(
        minutes: 5,
      ),
    );
  }

  // -- PRIVATE --

  /// Fetches the trades from the API
  /// This function is PRIVATE since no other endpoint needs this method without checknig the cached trades first.
  Future<List<TradeDto>> _fetchFromAPIs(
    Session session, {
    DateTime? from,
    DateTime? to,
  }) async {
    var authenticated = await session.authenticated;

    if (authenticated == null) {
      throw GeneralTradelyException('User not authenticated');
    }

    var trades = <TradeDto>[];

    try {
      // TODO enable meta trades
      // var metaTrades = await MetaApiEndpoint().getTrades(
      //   session,
      //   account.metaID!,
      // );

      //await MetaApiEndpoint().getTrades(session, account.metaID!);
      //print(metaTrades);
      // trades.addAll(metaTrades);
    } catch (e) {
      session.log('Error fetching trades from MetaTrader: $e');
    }

    var tlTrades = await TradeLockerEndpoint().getAllTrades(session);
    trades.addAll(tlTrades);

    trades.sort((a, b) => b.openTime.compareTo(a.openTime));

    return trades;
  }
}
