import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController value = new TextEditingController();
  String from = 'R\$';
  String to = 'U\$';
  String ans = '';
  double converted = 0;
  bool chg = true;

  void convert() {
    setState(() {
      chg = false;

      if (from == 'R\$' && to == 'U\$')converted = double.parse(value.text) / 5.49;
      if (from == 'R\$' && to == '€')converted = double.parse(value.text) / 6.30;
      if (from == 'R\$' && to == 'R\$')converted = double.parse(value.text);

      if (from == 'U\$' && to == 'R\$')converted = double.parse(value.text) * 5.49;
      if (from == 'U\$' && to == '€')converted = double.parse(value.text) * 0.87;
      if (from == 'U\$' && to == 'U\$')converted = double.parse(value.text);

      if (from == '€' && to == '€')converted = double.parse(value.text);
      if (from == '€' && to == 'U\$')converted = double.parse(value.text) / 0.87;
      if (from == '€' && to == 'R\$')converted = double.parse(value.text) * 6.30;

      ans = converted.toStringAsFixed(2);

    });
  }

  void reset() {
    setState(() {
      chg = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title(),
      backgroundColor: Colors.amber,
      body: body(),
    );
  }

  title() {
    return AppBar(
      title: Text("Comversor de Câmbio",
          style: TextStyle(fontSize: 20, color: Colors.black)),
      backgroundColor: Colors.lightBlue,
      centerTitle: true,
    );
  }

  body() {
    return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //L T R B
            padding(
                row(padding(text('Digite o Valor:\n', 30, Colors.black), 30, 0, 0, 0),
                    padding(container(textfield(value), 60, 200), 10, 0, 0, 0)), 0, 20, 0, 10),
            Row(children: <Widget>[
              padding(text('De:', 30, Colors.black), 30, 0, 0, 0),
              padding(dropdown_from(), 10, 0, 0, 0),
              padding(text('Para:', 30, Colors.black), 40, 0, 0, 0),
              padding(dropdown_to(), 10, 0, 0, 0),
            ]),
            padding(
                row(padding(button(), 0, 0, 10, 0),
                    padding(undo_button(), 10, 0, 0, 0)), 65, 20, 0, 0),
            padding(anim_container(),0,20,0,0)
          ],
        ));
  }

  container(content, double h, double w) {
    return Container(
      height: h,
      width: w,
      child: content,
    );
  }

  anim_container() {
    return AnimatedContainer(
        width: chg ? 0 : 230,
        height: chg ? 0 : 50,
        color: Colors.lightBlue,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        child:
        Center(child:text('$to $ans', 30, Colors.black)));
  }

  text(text, double size, color) {
    return Text(text, style: TextStyle(fontSize: size, color: color));
  }

  textfield(controll) {
    return TextField(
      controller: controll,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }

  dropdown_from() {
    return DropdownButton<String>(
      value: from,
      style: TextStyle(fontSize: 25, color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String? att) {
        setState(() {
          from = att!;
        });
      },
      items: <String>['R\$', 'U\$', '€']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  dropdown_to() {
    return DropdownButton<String>(
      value: to,
      style: TextStyle(fontSize: 25, color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String? att) {
        setState(() {
          to = att!;
        });
      },
      items: <String>['U\$', 'R\$', '€']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  button() {
    return ElevatedButton(
        onPressed: chg ? convert : null,
        child: text("Converter", 20, Colors.black));
  }

  undo_button() {
    return ElevatedButton(
        onPressed: reset,
        style:
        ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
        child: text("Refazer", 20, Colors.black));
  }

  row(context, content) {
    return Row(children: <Widget>[context, content]);
  }

  padding(context, double L, double T, double R, double B) {
    return Padding(padding: EdgeInsets.fromLTRB(L, T, R, B), child: context);
  }
}