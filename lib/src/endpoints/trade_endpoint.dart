import 'package:serverpod/serverpod.dart';
import 'package:tradelog_server/src/generated/protocol.dart';

class TradeEndpoint extends Endpoint { 
  @override
  bool get requireLogin => true;

  Future<void> addTrade(Session session, Trade trade) async { 
    await Trade.db.insertRow(session, trade);
  }

  Future<void> deleteTrade(Session session, Trade trade) async { 
    await Trade.db.deleteRow(session, trade);
  }
}