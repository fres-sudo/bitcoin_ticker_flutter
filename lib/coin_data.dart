import 'package:bitcoin_ticker/price_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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


  const String apiKey = '0098A378-FB2D-47BD-B73F-AC7CCA7A7578';

  const String coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    String requestURL = '$coinAPIURL/BTC/$selectedCurrency?apikey=$apiKey';
    http.Response response = await http.get(Uri.parse(requestURL));
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      double lastPrice = decodedData['rate'];
      return lastPrice.toStringAsFixed(0);
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
