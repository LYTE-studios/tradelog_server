import 'package:tradelog_server/src/generated/protocol.dart';

extension TradeLockerExtension on TradelockerPosition {
  static TradelockerPosition fromJson(List<dynamic> json) {
    return TradelockerPosition(
      id: json[0].toString(),
      tradableInstrumentId: int.parse(json[1]),
      routeId: int.parse(json[2]),
      side: json[3].toString(),
      quantity: double.parse(json[4]),
      avgPrice: double.parse(json[5]),
      stopLossId: json[6]?.toString(),
      takeProfitId: json[7]?.toString(),
      openDate: DateTime.fromMillisecondsSinceEpoch(int.parse(json[8])),
      unrealizedPl: double.parse(json[9]),
      strategyId: json[10]?.toString(),
    );
  }
}