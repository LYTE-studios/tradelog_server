class Configuration {
  // Define your debug and production URLs
  static const String tradelockerDemoURI =
      'https://demo.tradelocker.com/backend-api';
  static const String tradelockerURI =
      'https://live.tradelocker.com/backend-api';
  static const String metaApiURINYProd =
      'https://mt-client-api-v1.new-york.agiliumtrade.ai'; //tp be modified
  static const String metaApiURILNProd =
      'https://mt-client-api-v1.london.agiliumtrade.ai'; //to be modified

  static String get metaApiURINY => metaApiURINYProd;

  static String get metaApiURILN => metaApiURILNProd;
}
