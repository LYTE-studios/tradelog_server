import 'package:tradelog_server/src/generated/protocol.dart';
import 'package:tradelog_server/src/extensions/tradelocker_extension.dart';
import 'package:tradelog_server/src/util/instruments.dart';

extension TradeExtension on TradeDto {
  static TradeDto fromTradeLockerOrder(
    TradelockerOrder order,
  ) {
    final realizedPl = order.stopPrice;

    final Option option =
        order.side.toLowerCase() == 'buy' ? Option.long : Option.short;

    TradeStatus status = !order.isOpen ? TradeStatus.closed : TradeStatus.open;

    final totalInvestment = order.qty * order.avgPrice;

    final netRoi =
        totalInvestment != 0 ? ((realizedPl ?? 0) / totalInvestment) : 0.0;

    // Sub-request: Fetch symbol for each position, queued and rate-limited
    final String symbol =
        Instrument.instrumentMap[order.tradableInstrumentId] ?? 'unknown';

    return TradeDto(
      status: status,
      symbol: symbol,
      option: option,
      netRoi: netRoi,
      realizedPl: null,
      openTime: order.createdDate,
      lotSize: order.filledQty,
    );
  }

  static TradeDto fromTradeLocker(
    TradelockerPosition position,
  ) {
    final realizedPl = position.unrealizedPl;

    final Option option =
        position.side.toLowerCase() == 'buy' ? Option.long : Option.short;

    final totalInvestment = position.quantity * position.avgPrice;

    final netRoi = totalInvestment != 0 ? (realizedPl / totalInvestment) : 0.0;

    TradeStatus status =
        position.quantity == 0 ? TradeStatus.closed : TradeStatus.open;

    // Sub-request: Fetch symbol for each position, queued and rate-limited
    final String symbol =
        Instrument.instrumentMap[position.tradableInstrumentId] ?? 'unknown';

    return TradeDto(
      status: status,
      symbol: symbol,
      option: option,
      netRoi: netRoi,
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
