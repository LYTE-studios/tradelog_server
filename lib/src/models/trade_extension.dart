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

  static DisplayTrade fromTradelocker(TradelockerPosition position, TradelockerInstrument instrument) {
    // Assuming 'open' if position is unrealized, otherwise could check a close date if available
    String status = position.unrealizedPl != 0 ? 'open' : 'closed';

    // Calculate the net profit/loss
    double netpl = position.unrealizedPl;

    // Calculate ROI: netpl / (avgPrice * quantity)
    double netroi = netpl / (position.avgPrice * position.quantity);

    return DisplayTrade(
      openTime: position.openDate,
      symbol: instrument.name,
      direction: position.side,
      status: status,
      netpl: netpl,
      netroi: netroi,
    );
  }
}