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
  TextEditingController name = new TextEditingController();
  TextEditingController age = new TextEditingController();
  String sexo = 'Sexo';
  String school = 'Escolaridade';
  double slide = 2000;
  bool swii = false;
  bool confirmed = true;

  String saved_name = '';
  String saved_age = '';
  String saved_sex = '';
  String saved_school = '';
  String saved_limit = '';
  String origin = '';

  void confirm() {
    setState(() {
      confirmed = !confirmed;
      saved_name = 'Nome: ${(name.text)}';
      saved_age = 'Idade: ${(age.text)}';
      if (sexo != 'Sexo')
        saved_sex = 'Sexo: $sexo';
      else {
        saved_sex = 'Sexo: Não Informado';
      }
      if (school != 'Escolaridade')
        saved_school = 'Escolaridade: $school';
      else {
        saved_school = 'Escolaridade: Não Informada';
      }
      saved_limit = 'Limite: ${slide.toString()}';
      if (swii = false)
        origin = 'Nacionalidade: Estrangeiro';
      else {
        origin = 'Nacionalidade: Brasileiro';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: title(),
        body: body(),
      ),
    );
  }

  title() {
    return AppBar(
      title: Text(
        "Cadastro de Conta",
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.lightBlue,
    );
  }

  body() {
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.amber,
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                padding(textfield(TextInputType.name, "Nome:", 20, name), 10,
                    10, 10, 10),
                padding(textfield(TextInputType.number, "Idade:", 20, age), 10,
                    0, 10, 0),
                Row(
                  children: <Widget>[
                    padding(dropdown(), 20, 10, 10, 0),
                    padding(dropdownEsc(), 10, 10, 0, 0),
                  ],
                ),
                padding(text('Limite da conta', 20, Colors.black), 0, 20, 240, 0),
                padding(slider(), 0, 0, 0, 0),
                Row(children: <Widget>[
                  padding(text('Estrangeiro', 20, Colors.black), 20, 0, 0, 0),
                  switchy(),
                ]),
                button(),
                animatedContainer(),
              ],
            ),
          ),
        ));
  }

  padding(context, double left, double top, double right, double bottom) {
    return Container(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: context,
    );
  }

  text(String content, double size, color) {
    return Text(
      content,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }

  textfield(TextInputType input, String text, double FontSize,
      TextEditingController controll) {
    return TextField(
      keyboardType: input,
      controller: controll,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(fontSize: FontSize, color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }

  dropdown() {
    return DropdownButton<String>(
      value: sexo,
      iconSize: 30,
      elevation: 4,
      style: TextStyle(fontSize: 20, color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String? newValue) {
        setState(() {
          sexo = newValue!;
        });
      },
      items: <String>['Sexo', 'Masculino', 'Feminino', 'LGBTQIA+']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  dropdownEsc() {
    return DropdownButton<String>(
      value: school,
      iconSize: 30,
      elevation: 4,
      style: const TextStyle(fontSize: 20, color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String? newValue) {
        setState(() {
          school = newValue!;
        });
      },
      items: <String>[
        'Escolaridade',
        'Ensino Médio',
        'Curso Superior',
        'Pós Graduado'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  slider() {
    return Slider(
      value: slide,
      min: 0,
      max: 5000,
      divisions: 1000,
      label: slide.round().toString(),
      activeColor: Colors.black,
      onChanged: (double value) {
        setState(() {
          slide = value;
        });
      },
    );
  }

  switchy() {
    return Switch(
      value: swii,
      activeTrackColor: Colors.black,
      activeColor: Colors.white,
      onChanged: (value) {
        setState(() {
          swii = value;
        });
      },
    );
  }

  button() {
    return ElevatedButton(
        onPressed: confirm,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.lightBlue)),
        child: text('Cadastrar', 20, Colors.black));
  }

  animatedContainer() {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      width: confirmed ? 0.0 : 320.0,
      height: confirmed ? 0.0 : 210.0,
      color: confirmed ? Colors.black : Colors.lightBlue,
      alignment: Alignment.center,
      curve: Curves.fastLinearToSlowEaseIn,
      child: Column(children: <Widget>[
        Align(
            alignment: Alignment.topCenter,
            child: text('Conta Cadastrada!', 25, Colors.black)),
        padding(align(text(saved_name, 20, Colors.black)), 10, 10, 0, 0),
        padding(align(text(saved_age, 20, Colors.black)), 10, 5, 0, 0),
        padding(align(text(saved_sex, 20, Colors.black)), 10, 5, 0, 0),
        padding(align(text(saved_school, 20, Colors.black)), 10, 5, 0, 0),
        padding(align(text(saved_limit, 20, Colors.black)), 10, 5, 0, 0),
        padding(align(text(origin, 20, Colors.black)), 10, 5, 0, 0),
      ]),
    );
  }

  align(context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: context,
    );
  }
}