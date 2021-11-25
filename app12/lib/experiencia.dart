import 'package:flutter/material.dart';

class experiencia extends StatelessWidget {
  const experiencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
      backgroundColor: Colors.amber,
    );
  }

  _body(BuildContext context) {
    return Center(
        child:Container(
            height: 500,
            width: 500,
            child: Image.asset(
                "assets/images/4.png"
            )
        ));
  }
}