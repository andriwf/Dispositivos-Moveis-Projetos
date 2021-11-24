import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.lightBlueAccent
      ),
      home: widgetHome(),
    );
  }
}

class widgetHome extends StatelessWidget {
  const widgetHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu primeiro APP"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.amber,
        child: Center(
          child: Text("Andriw Felipe Costa de Lima Santos",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.w100,
                //decoration: TextDecoration.overline,
                decorationColor: Colors.amber,
                decorationStyle: TextDecorationStyle.dashed,

              )),
        ),
      ),
    );
  }
}
