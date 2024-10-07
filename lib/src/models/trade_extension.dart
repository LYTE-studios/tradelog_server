import 'package:tradelog_server/src/generated/protocol.dart';

extension TradeExtension on DisplayTrade {
  static DisplayTrade fromMetaTrader(MetatraderPosition position) {
  // Derive the direction from the position type ("buy" -> "long", "sell" -> "short")
  String direction = position.type == 'buy' ? 'long' : 'short';

  // Determine the trade status based on the volume; if volume is zero, position is closed
  String status = position.volume == 0
      ? 'closed'
      : 'open';

  // Calculate the Net Profit/Loss (realizedProfit if closed, else unrealizedProfit)
  double netpl = status == 'closed' ? position.realizedProfit : position.unrealizedProfit;

  // Handle cases where openPrice or volume might be zero to avoid division by zero errors
  double initialInvestment = position.openPrice * position.volume;
  double netroi = (initialInvestment != 0) ? (netpl / initialInvestment) * 100 : 0.0;

  // Fetch the corresponding open time from the position
  DateTime openTime = position.time;

  return DisplayTrade(
    openTime: openTime,
    symbol: position.symbol,
    direction: direction,
    status: status,
    netpl: netpl,
    netroi: netroi,
  );
}

}