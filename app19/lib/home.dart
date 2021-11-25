import 'api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController valor = TextEditingController();
  List<Currency> currencies = [];
  bool loadingCurrencies = true;
  String? valueFrom = "1";
  String? valueTo = "1";

  String? currency = "";

  double result = 0.0;

  getAllCurrencies() async {
    var api = Api();
    Currency eur = await api.getFullCurrencyEUR();
    Currency brl = await api.getFullCurrencyBRL();
    Currency btc = await api.getFullCurrencyBTC();
    Currency usd = await api.getFullCurrencyUSD();

    List<Currency> newCurrencies = [eur, brl, btc, usd];

    setState(() {
      currencies = newCurrencies;
    });
  }

  @override
  void initState() {
    getAllCurrencies();
    super.initState();
  }

  void _setResult() {
    setState(() {
      Currency currencyFrom = currencies.elementAt(int.parse(valueFrom!) - 1);
      Currency currencyTo = currencies.elementAt(int.parse(valueTo!) - 1);

      if (currencyTo.title == "Real") {
        var res = currencyFrom.convertToReal(double.parse(valor.text));
        setState(() {
          result = res;
        });
      } else if (currencyTo.title == "Euro") {
        var res = currencyFrom.convertToEuro(double.parse(valor.text));
        setState(() {
          result = res;
        });
      } else if (currencyTo.title == "Dólar") {
        var res = currencyFrom.convertToDolar(double.parse(valor.text));
        setState(() {
          result = res;
        });
      } else if (currencyTo.title == "Bitcoin") {
        var res = currencyFrom.convertToBitcoin(double.parse(valor.text));
        setState(() {
          result = res;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor de Moedas"),

        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: Colors.amber,
      body: _corpo(

      ),

    );
  }

  _corpo() {
    return ListView(

      children: [
        _inputText('Valor', valor),
        SizedBox(
          height: 30,
        ),
        _dropdownValueFrom(),
        SizedBox(
          height: 30,
        ),
        _dropdownValueTo(),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: _setResult,
          child: Text("Converter",
              style: TextStyle(color: Colors.black, fontSize: 20)),
        ),
        SizedBox(
          height: 40,
        ),
        _result()
      ],
    );
  }

  _inputText(label, controller) {
    return TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.black,
          ),
        ),
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black, fontSize: 20),
        controller: controller);
  }

  _dropdownValueTo() {
    return currencies.length <= 0
        ? Text("Carregando")
        : DropdownButton<String>(
      isExpanded: true,
      value: valueTo,
      items: currencies.map((currency) {
        return DropdownMenuItem(
          child: Text("${currency.title}"),
          value: currency.id.toString(),
        );
      }).toList(),
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      onChanged: (String? valorSelecionado) {
        setState(() {
          valueTo = valorSelecionado;
        });
      },
    );
  }

  _dropdownValueFrom() {
    return currencies.length <= 0
        ? Text("Carregando")
        : DropdownButton<String>(
      isExpanded: true,
      value: valueFrom,
      items: currencies.map((currency) {
        return DropdownMenuItem(
          child: Text("${currency.title}"),
          value: currency.id.toString(),
        );
      }).toList(),
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      onChanged: (String? valorSelecionado) {
        setState(() {
          valueFrom = valorSelecionado;
        });
      },
    );
  }

  _result(){
    return Text("Valor Convertido: ${result.toStringAsPrecision(4)}", style: TextStyle(
      fontSize: 20,
    ));
  }
}

class Currency {
  final String id;
  final String title;
  final double toReal;
  final double toEuro;
  final double toBitCoin;
  final double toDolar;

  Currency(this.id, this.title, this.toReal, this.toEuro, this.toBitCoin,
      this.toDolar);

  double convertToReal(value) {
    return value * toReal;
  }

  double convertToEuro(value) {
    return value * toEuro;
  }

  double convertToDolar(value) {
    return value * toDolar;
  }

  double convertToBitcoin(value) {
    return value * toBitCoin;
  }
}