import 'dart:convert';

import 'package:bitcoin_checker/services/apiKey.dart';
import 'package:http/http.dart' as http;

Future<String> exchangeRates(String cryptoCurrency, String currency) async {
  http.Response response = await http.get(
    Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/$cryptoCurrency/$currency?apikey=$apiKey'),
  );
  var data = jsonDecode(response.body);
  return data['rate'].toStringAsFixed(3);
}
