import 'package:tradelog_server/src/generated/protocol.dart';

extension TradeLockerExtension on TradelockerPosition {
  static TradelockerPosition positionFromJson(List<dynamic> json) {
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

  static TradelockerOrder orderFromJson(List<dynamic> json) {
  return TradelockerOrder(
    id: json[0].toString(),
    tradableInstrumentId: int.parse(json[1]),
    routeId: int.parse(json[2]),
    qty: json[3] != null ? double.parse(json[3].toString()) : 0.0, // Default to 0.0 for null
    side: json[4].toString(),
    type: json[5].toString(),
    status: json[6].toString(),
    filledQty: json[7] != null ? double.parse(json[7].toString()) : 0.0, // Default to 0.0 for null
    avgPrice: json[8] != null ? double.parse(json[8].toString()) : 0.0, // Default to 0.0 for null
    price: json[9] != null ? double.parse(json[9].toString()) : 0.0,    // Default to 0.0 for null
    stopPrice: json[10] != null ? double.parse(json[10].toString()) : null, // Nullable
    validity: json[11].toString(),
    expireDate: json[12] != null
        ? DateTime.fromMillisecondsSinceEpoch(int.parse(json[12].toString()))
        : null, // Nullable
    createdDate: DateTime.fromMillisecondsSinceEpoch(int.parse(json[13].toString())),
    lastModified: DateTime.fromMillisecondsSinceEpoch(int.parse(json[14].toString())),
    isOpen: json[15]?.toString() == 'true', // Parse as boolean
    positionId: json[16]?.toString(),        // Nullable
    stopLoss: json[17] != null ? double.parse(json[17].toString()) : null, // Nullable
    stopLossType: json[18]?.toString(),      // Nullable
    takeProfit: json[19] != null ? double.parse(json[19].toString()) : null, // Nullable
    takeProfitType: json[20]?.toString(),    // Nullable
    strategyId: json[21]?.toString(),        // Nullable
  );
}

}