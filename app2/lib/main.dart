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
  int x = 0;

  // ignore: non_constant_identifier_names
  Call(String a) {
    setState(() {
      if (a == '+')
        x++;
      else
        x--;
      if (x < 0) x = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _Title(),
      backgroundColor: Colors.amber,
      body: _CountSquare(),

    );
  }

// ignore: non_constant_identifier_names
  _Title() {
    return AppBar(
      title: Text('Contador de Gatinhos',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w900, fontSize: 40)),
      centerTitle: true,
      backgroundColor: Colors.lightBlue[300],
    );
  }

// ignore: non_constant_identifier_names
  _CountSquare() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[_CountPad()],
      ),
    );
  }

// ignore: non_constant_identifier_names
  _CountPad() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
          width: 360,
          height: 515,
          //color: Colors.white,
          child: Entitys()),
    );
  }

// ignore: non_constant_identifier_names
  Entitys() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text('$x', style: TextStyle(color: Colors.black, fontSize: 100)),
        _PlusMinusSquares()
      ],
    );
  }

// ignore: non_constant_identifier_names
  _PlusMinusSquares() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // _PlusSquare(callpos),
          // _MinusSquare(callneg),
          Square('-', Colors.red),
          Square('+', Colors.green)
        ]);
  }

  // ignore: non_constant_identifier_names
  Square(String action, colored) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: Container(
            width: 80,
            height: 80,
            // ignore: deprecated_member_use
            child: RaisedButton(
              onPressed: () => Call(action),
              child: Text(action,
                  style: TextStyle(color: Colors.white, fontSize: 50)),
              color: colored,
            )));
  }
}