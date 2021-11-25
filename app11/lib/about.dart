import 'package:flutter/material.dart';

// ignore: must_be_immutable
class About extends StatelessWidget {
  String aboutName;
  String aboutAge;
  String aboutSex;
  String aboutSchl;
  double aboutCurrent;
  bool aboutCheck;

  About({required this.aboutName, required this.aboutAge, required this.aboutSex, required this.aboutSchl,
    required this.aboutCurrent, required this.aboutCheck});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: t(),
      body: b(),
        backgroundColor: Colors.amber
    );
  }

  t(){
    return AppBar(
        title: Text("Dados Informados"),
        foregroundColor: Colors.black,
        centerTitle: true,
        backgroundColor: Colors.lightBlue
    );
  }

  b(){
    return SingleChildScrollView(
      child: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                txt('\nNome: $aboutName', 20, Colors.black, FontWeight.bold),
                txt('Idade: $aboutAge', 20, Colors.black, FontWeight.bold),
                txt('Sexo: $aboutSex', 20, Colors.black, FontWeight.bold),
                txt('Escolaridade: $aboutSchl', 20, Colors.black, FontWeight.bold),
                txt('Limite de Credito: R\$$aboutCurrent', 20, Colors.black, FontWeight.bold),
                txt('Brasileiro: $aboutCheck', 20, Colors.black, FontWeight.bold),
              ]
          )
      ),
    );
  }

  txt(content, double size, color, weight){
    return Text(
        content,
        style: TextStyle(fontSize: size, color: color, fontWeight: weight)
    );
  }

  bot(BuildContext context){
    return ElevatedButton(
      child: txt('Confirmar', 20, Colors.black, FontWeight.normal),
      style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.black)),
      onPressed: (){
        Navigator.pop(context);
      },
    );
  }
}