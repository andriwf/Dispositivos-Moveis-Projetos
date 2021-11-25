import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Home()
    );
  }
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return
      DefaultTabController(
          length: 3,
          child:Scaffold(
            appBar: title(),
            body: body(),
            backgroundColor: Colors.amber,
          ));
  }

  title(){
    return AppBar(
        title:Text('Menu de navegação',
            style: TextStyle(fontSize: 20, color: Colors.black)),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        bottom: TabBar(tabs: [
          Tab(text: 'O mais belo'),
          Tab(text: 'Eu estudando'),
          Tab(text: 'Experiência para trabalhar e trabalhar para experiência'),
        ],)
    );
  }

  body(){
    return TabBarView(
      children: [
        image(),
        image2(),
        image3(),
      ],
    );
  }

  image(){
    return
      Center(child: Image.asset('assets/images/2.png'),
          );
  }

  image2(){
    return
      Center(child: Image.asset('assets/images/3.png'),
      );
  }

  image3(){
    return
      Center(child: Image.asset('assets/images/4.png'),
      );
  }
}