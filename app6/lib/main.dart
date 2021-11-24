import 'dart:math';
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
  TextEditingController guess = new TextEditingController();
  bool _pressed = false;
  var change_green = Colors.green;
  var change_cont = Colors.lightBlue;
  var x = null;

  void reset() {
    setState(() {
      change_green = Colors.green;
      change_cont = Colors.lightBlue;
      _pressed = false;
      x = null;
    });
  }

  void guess_it() {
    setState(() {
      int guessed = int.parse(guess.text);
      var random = new Random();
      x = random.nextInt(9) + 1;
      _pressed = true;
      change_green = Colors.grey;

      if (guessed == x) {
        change_cont = Colors.lightBlue;
      } else {
        change_cont = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title(),
      body: body(),
        backgroundColor: Colors.amber
    );
  }

  title() {
    return AppBar(
      title: Text("Consegue adivinhar o número? ",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
          )),
      centerTitle: true,
      backgroundColor: Colors.lightBlue,
    );
  }

  body() {
    return Container(
        width: 360,
        height: 515,

        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              column(),
            ],
          ),
        ));
  }

  column() {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Column(children: <Widget>[
          container(change_cont),
          text_container(textfield()),
          button(change_green),
        ]));
  }

  container(change) {
    return Container(
      height: 240,
      width: 240,
      color: Colors.transparent,
      child: Center(
        child: Text(
          _pressed ? "$x" : "?",
          style: TextStyle(
            color: change,
            fontSize: 150,
          ),
        ),
      ),
    );
  }

  text_container(content) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      height: 80,
      width: 250,
      child: content,
    );
  }

  textfield() {
    return TextField(
      keyboardType: TextInputType.number,
      controller: guess,
      decoration: InputDecoration(
        hintText: "Digite um número de 1 a 10",
        hintStyle: TextStyle(fontSize: 15, color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  button(change_green) {
    return Row(children: <Widget>[
      Container(
          padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
          width: 190,
          height: 50,
          child: ElevatedButton(
            onPressed: _pressed ? null : guess_it,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(change_green),
            ),
            child: Text("Adivinhar",
                style: TextStyle(fontSize: 20, color: Colors.black)),
          )),
      Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          width: 60,
          height: 50,
          child: ElevatedButton(
            onPressed: reset,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            child: Icon(
              Icons.restart_alt,
              size: 30,
              color: Colors.black,
            ),
          ))
    ]);
  }

  background(image_ad) {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(image_ad),
        fit: BoxFit.cover,
      ),
    );
  }
}