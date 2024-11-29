import 'package:tradelog_server/src/generated/protocol.dart';
import 'package:tradelog_server/src/util/instruments.dart';

extension TradeExtension on TradeDto {
  void calculateProfits(double price, double stopPrice, double quantity) {
    if (option == Option.long) {
      realizedPl = (stopPrice - price) * quantity;
    } else {
      realizedPl = (price - stopPrice) * quantity;
    }
    double totalInvestment = quantity * price;

    netRoi = totalInvestment != 0 ? ((realizedPl ?? 0) / totalInvestment) : 0.0;
  }

  static TradeDto fromTradeLockerOrder(
    TradelockerOrder order, String symbol,
  ) {
    TradeStatus status = !order.isOpen ? TradeStatus.closed : TradeStatus.open;

    final Option option =
        order.side.toLowerCase() == 'buy' ? Option.long : Option.short;
    
    TradeDto dto = TradeDto(
      status: status,
      symbol: symbol,
      option: option,
      // netRoi: netRoi,
      // realizedPl: realizedPl,
      openTime: order.createdDate,
      lotSize: order.filledQty,
    );

    dto.calculateProfits(order.price, order.stopPrice ?? 0, order.qty);

    return dto;
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

  static TradeDto fromMetaTraderOrder(MetatraderOrder order) {
    // Determine trade status
    TradeStatus status = order.type == 'ORDER_TYPE_CLOSE'
        ? TradeStatus.closed
        : TradeStatus.open;

    // Determine option (long/short)
    Option option = Option.short;
    if (order.type == 'ORDER_TYPE_BUY' || order.type == 'ORDER_TYPE_BUY_LIMIT') {
      option = Option.long;
    }

    // Fetch symbol for the trade
    final String symbol = order.symbol;

    // Initialize TradeDto
    TradeDto dto = TradeDto(
      status: status,
      symbol: symbol,
      option: option,
      openTime: order.doneTime ?? DateTime.now(),
      lotSize: order.volume,
    );

    // Calculate profits and ROI
    dto.calculateProfits(order.openPrice ?? 0, order.stopLimitPrice ?? 0, order.volume);

    return dto;
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
