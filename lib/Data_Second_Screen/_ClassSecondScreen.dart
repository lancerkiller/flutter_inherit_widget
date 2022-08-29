import 'package:flutter/material.dart';

import '../Data.dart';

class ClassSecondScreen extends StatelessWidget {
  final Data? data;

  const ClassSecondScreen({this.data}) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PASS DATA FROM THE CLASS") ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Data: ${data?.text}"),
            Text("Counter: ${data?.counter}"),
            Text("Data: ${data?.dateTime}")

          ],
        ),
      )
    );
  }
}
