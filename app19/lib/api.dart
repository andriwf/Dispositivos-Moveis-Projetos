import 'home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String baseURL = 'https://economia.awesomeapi.com.br/json/last';

class Api {
  getFullCurrencyUSD() async {
    String url = '$baseURL/USD-BRL';
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> usdToBRL = json.decode(response.body);

    url = '$baseURL/USD-EUR';
    response = await http.get(Uri.parse(url));
    Map<String, dynamic> usdToEUR = json.decode(response.body);

    url = '$baseURL/BTC-USD';
    response = await http.get(Uri.parse(url));
    Map<String, dynamic> usdToBTC = json.decode(response.body);

    Currency usd = Currency(
      "4",
      "Dólar",
      double.parse(usdToBRL["USDBRL"]["ask"]),
      double.parse(usdToEUR["USDEUR"]["ask"]),
      1 / double.parse(usdToBTC["BTCUSD"]["ask"]),
      1.0,
    );

    return usd;
  }

  getFullCurrencyBRL() async {
    String url = '$baseURL/BRL-USD';
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> brlToUSD = json.decode(response.body);

    url = '$baseURL/BRL-EUR';
    response = await http.get(Uri.parse(url));
    Map<String, dynamic> brlToEUR = json.decode(response.body);

    url = '$baseURL/BTC-BRL';
    response = await http.get(Uri.parse(url));
    Map<String, dynamic> brlToBTC = json.decode(response.body);

    Currency usd = Currency(
      "2",
      "Real",
      1,
      double.parse(brlToEUR["BRLEUR"]["ask"]),
      double.parse(brlToBTC["BTCBRL"]["ask"]),
      1 / double.parse(brlToUSD["BRLUSD"]["ask"]),
    );

    return usd;
  }

  getFullCurrencyEUR() async {
    String url = '$baseURL/EUR-USD';
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> eurToUSD = json.decode(response.body);

    url = '$baseURL/EUR-BRL';
    response = await http.get(Uri.parse(url));
    Map<String, dynamic> eurToBRL = json.decode(response.body);

    url = '$baseURL/BTC-EUR';
    response = await http.get(Uri.parse(url));
    Map<String, dynamic> eurToBTC = json.decode(response.body);

    Currency usd = Currency(
      "1",
      "Euro",
      double.parse(eurToBRL["EURBRL"]["ask"]),
      1,
      1 / double.parse(eurToBTC["BTCEUR"]["ask"]),
      double.parse(eurToUSD["EURUSD"]["ask"]),
    );

    return usd;
  }

  getFullCurrencyBTC() async {
    String url = '$baseURL/BTC-USD';
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> btcToUSD = json.decode(response.body);

    url = '$baseURL/BTC-BRL';
    response = await http.get(Uri.parse(url));
    Map<String, dynamic> btcToBRL = json.decode(response.body);

    url = '$baseURL/BTC-EUR';
    response = await http.get(Uri.parse(url));
    Map<String, dynamic> btcToEUR = json.decode(response.body);

    Currency usd = Currency(
      "3",
      "Bitcoin",
      double.parse(btcToBRL["BTCBRL"]["ask"]),
      double.parse(btcToEUR["BTCEUR"]["ask"]),
      1,
      double.parse(btcToUSD["BTCUSD"]["ask"]),
    );

    return usd;
  }
}