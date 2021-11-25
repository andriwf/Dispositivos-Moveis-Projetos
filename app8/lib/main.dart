import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      title: Text(
        'Lojinha das Lotus',
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.lightBlue,
    );
  }

  body() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          carousel(),
        ],
      ),
    );
  }

  image(link) {
    return Image.network(
      link,
      width: 200,
      height: 200,

    );
  }

  carousel() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 50, 0, 20),
      height: 400,
      child: ListView(
        children: <Widget>[
          pading(
              containerAd(
                  image(
                      'assets/images/blacklotus.jpg'),
                  container(
                      pading(text('Black Lotus\nRS 500.000,00', 30.0, Colors.black), 0, 10,
                          0, 0),
                      pading(available(), 0, 10, 0, 0))),
              30,
              0,
              0,
              30),
          pading(
              containerAd(
                  image(
                      'assets/images/bloomlotus.jpg'),
                  container(
                      pading(text('Lotus Bloom\nRS 9,50 ', 30.0, Colors.black), 0, 10,
                          0, 0),
                      pading(available(), 0, 10, 0, 0))),
              30,
              0,
              0,
              30),
          pading(
              containerAd(
                  image(
                      'assets/images/gildedlotus.jpg'),
                  container(
                      pading(text('Gilded Lotus\nRS 13.18', 30.0, Colors.black), 0, 10,
                          0, 0),
                      pading(available(), 0, 10, 0, 0))),
              30,
              0,
              0,
              30),
          pading(
              containerAd(
                  image(
                      'assets/images/jeweledlotus.jpg'),
                  container(
                      pading(
                          text('Jeweled Lotus\nRS 456,00', 30.0, Colors.black), 0, 10, 0, 0),
                      pading(available(), 0, 10, 0, 0))),
              30,
              0,
              0,
              30),
          pading(
              containerAd(
                  image(
                      'assets/images/petallotus.jpg'),
                  container(
                      pading(text('Lotus Petal\n65,90', 30.0, Colors.black), 0,
                          10, 0, 0),
                      pading(unavailable(), 0, 10, 0, 0))),
              30,
              0,
              0,
              30),

        ],
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  containerAd(context, content) {
    return Container(
        height: 300,
        width: 300,
        color: Colors.lightBlue,
        child: Column(children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0), child: context),
          content
        ]));
  }

  container(content, describe) {
    return Container(
      child: Column(
        children: <Widget>[content, describe],
      ),
    );
  }

  pading(content, double L, double T, double B, double R) {
    return Padding(padding: EdgeInsets.fromLTRB(L, T, R, B), child: content);
  }

  text(content, double size, color) {
    return Text(content, style: TextStyle(fontSize: size, color: color));
  }

  available() {
    return text('Disponivel', 30.0, Colors.lightGreenAccent);
  }

  unavailable() {
    return text('Indisponivel', 30.0, Colors.red);
  }
}