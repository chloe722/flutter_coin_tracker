import 'package:bitcoin_ticker/model/coin_data_response.dart';
import 'package:bitcoin_ticker/services/network_helper.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const bitcoinAverageURL =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker/';

class CoinData {

  Future<CoinDataResponse> getCoinData(
      {String cryptoCoin, String currency}) async {
    String url = '$bitcoinAverageURL$cryptoCoin$currency';
    NetworkHelper networkHelper = NetworkHelper();
    Map res = await networkHelper.getData(url: url);
    return CoinDataResponse.fromJson(res);
  }
}
