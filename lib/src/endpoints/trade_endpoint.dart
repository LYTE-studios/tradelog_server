import 'package:serverpod/serverpod.dart';
import 'package:tradelog_server/src/generated/protocol.dart';
import 'dart:convert'; // For converting file data to string
import 'package:csv/csv.dart';

class TradeEndpoint extends Endpoint { 
  @override
  bool get requireLogin => true;

  Future<void> addTrade(Session session, Trade trade) async { 
    await Trade.db.insertRow(session, trade);
  }

  Future<void> deleteTrade(Session session, Trade trade) async { 
    await Trade.db.deleteRow(session, trade);
  }

  // Future<List<DisplayTrade>> fetchTrades(Session session) async { 
  //   return await Trade.db.find(session);
  // }

  // Method to handle the file upload and process the CSV
  Future<String> importTrades(Session session, List<int> csvFile) async {
    try {
      // Convert the uploaded file (binary) to a string
      final csvString = utf8.decode(csvFile);

      // Parse the CSV using the csv package
      final csvData = CsvToListConverter().convert(csvString);

      // Validate and process the CSV data (each row represents a trade)
      await _processTradeData(session, csvData);

      return 'Success: Trades have been imported';
    } catch (e) {
      session.log('Error importing trades: $e');
      return 'Error: Unable to process the file';
    }
  }

  // Helper function to process CSV data and store it in the database
  Future<void> _processTradeData(Session session, List<List<dynamic>> csvData) async {
    for (var row in csvData.skip(1)) { // Skip header row
      try {
        // Assuming the CSV has columns: tradeId, symbol, direction, quantity, price
        final tradeId = row[0] as int;
        final symbol = row[1] as String;
        final direction = row[2] as String;
        final quantity = row[3] as double;
        final price = row[4] as double;

        // Insert each trade into the database (replace 'Trade' with your DB model)
        // var trade = Trade(
        //   tradeId: tradeId,
        //   symbol: symbol,
        //   direction: direction,
        //   quantity: quantity,
        //   price: price,
        // );

        //await Trade.db.insertRow(session, trade);
      } catch (e) {
        session.log('Error processing row $row: $e');
        // Optionally, continue processing other rows even if one fails
      }
    }
  }
}
