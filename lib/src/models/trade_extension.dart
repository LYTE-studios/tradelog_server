import 'package:tradelog_server/src/generated/protocol.dart';
import 'package:tradelog_server/src/models/tradelocker_extension.dart';
import 'package:tradelog_server/src/util/instruments.dart';

extension TradeExtension on TradeDto {
  static TradeDto fromTradeLocker(
    TradelockerPosition position,
    Map<String, List<TradelockerOrder>> ordersByPosition,
  ) {
    final associatedOrders = ordersByPosition[position.id] ?? [];

    // Calculate realized P&L and ROI for the position
    final realizedPl = position.calculateRealizedPl(associatedOrders);
    // final totalInvestment = position.quantity * position.avgPrice;

    // final netRoi =
    //     totalInvestment != 0 ? (realizedPl / totalInvestment) * 100 : 0.0;

    TradeStatus status =
        position.quantity == 0 ? TradeStatus.closed : TradeStatus.open;

    // Sub-request: Fetch symbol for each position, queued and rate-limited
    final String symbol =
        Instrument.instrumentMap[position.tradableInstrumentId] ?? 'unknown';

    return TradeDto(
      status: status,
      symbol: symbol,

      // TODO: Option
      option: Option.long,

      // TODO FEE

      realizedPl: realizedPl,

      openTime: position.openDate,

      lotSize: position.quantity,
    );
  }

  static TradeDto fromMetaTrader(MetatraderPosition position) {
    Option option = position.type == 'buy' ? Option.long : Option.short;

    // Determine the trade status based on the volume; if volume is zero, position is closed
    TradeStatus status =
        position.volume == 0 ? TradeStatus.closed : TradeStatus.open;

    // Calculate the Net Profit/Loss (realizedProfit if closed, else unrealizedProfit)
    // double netPnl = status == TradeStatus.closed
    //     ? position.realizedProfit
    //     : position.unrealizedProfit;

    // Handle cases where openPrice or volume might be zero to avoid division by zero errors
    // double initialInvestment = position.openPrice * position.volume;
    //
    // double netroi =
    //     (initialInvestment != 0) ? (netpl / initialInvestment) * 100 : 0.0;

    // Fetch the corresponding open time from the position
    DateTime openTime = position.time;

    return TradeDto(
      status: status,
      symbol: position.symbol,
      option: option,
      // TODO: calculate fee currency
      feeCurrency: "\$",
      fee: position.commission,
      openTime: openTime,
      lotSize: position.volume,
      takeProfit: position.takeProfit,
      stopLoss: position.stopLoss,
    );
  }

  static TradeDto fromDefault(Trade trade) {
    return TradeDto(
      status: trade.status,
      symbol: trade.symbol,
      option: trade.option,
      feeCurrency: trade.feeCurrency,
      fee: trade.fee,
      openTime: trade.openTime,
      lotSize: trade.lotSize,
      takeProfit: trade.takeProfit,
      stopLoss: trade.stopLoss,
    );
  }
}
