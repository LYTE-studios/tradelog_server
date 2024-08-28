class Configuration {
  // Define your debug and production URLs
  static const String tradelockerURIDebug = 'https://demo.tradelocker.com/backend-api';
  static const String tradelockerURIProd = 'https://live.tradelocker.com/backend-api';

  static const String metaApiURINYDebug = 'https://mt-client-api-v1.new-york.agiliumtrade.ai';
  static const String metaApiURINYProd = 'https://mt-client-api-v1.new-york.agiliumtrade.ai'; //tp be modified

  static const String metaApiURILNDebug = 'https://mt-client-api-v1.london.agiliumtrade.ai';
  static const String metaApiURILNProd = 'https://mt-client-api-v1.london.agiliumtrade.ai'; //to be modified

  // Set this to true for debug mode
  static bool isDebug = true;

  // Method to get the correct URL based on debug or production mode
  static String get tradelockerURI => isDebug ? tradelockerURIDebug : tradelockerURIProd;
  static String get metaApiURINY => isDebug ? metaApiURINYDebug : metaApiURINYProd;
  static String get metaApiURILN => isDebug ? metaApiURILNDebug : metaApiURILNProd;
}