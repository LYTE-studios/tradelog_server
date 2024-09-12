import 'package:tradelog_server/src/generated/protocol.dart';

extension TradeExtension on DisplayTrade {
  static DisplayTrade fromMetaTrader(MetatraderPosition position/*, List<MetatraderOrder> orders*/) {
    // Derive the direction from the position type ("buy" -> "long", "sell" -> "short")
    String direction = position.type == 'buy' ? 'long' : 'short';
    
    // Determine the trade status based on if the position is still open or closed
    String status = position.realizedProfit != 0
        ? 'closed'
        : 'open';
    
    // Calculate the Net Profit/Loss (realizedProfit or unrealizedProfit depending on status)
    double netpl = position.realizedProfit != 0 ? position.realizedProfit : position.unrealizedProfit;
    
    // Calculate the ROI as netpl / (openPrice * volume)
    double netroi = netpl / (position.openPrice * position.volume);
    
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