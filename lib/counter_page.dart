import 'package:flutter/material.dart';
import 'package:flutterinherit/state_widget.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    //final counter = StateInheritWidget.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  onPressed: () {
                   incrementCounter2();
                  },
                  child: Text("Counter!"))
            ],
          )
        ],
      ),
    );
  }

  void incrementCounter2() {
    final provider = StateInheritWidget.of(context);
    provider?.incrementCounter();
    Navigator.pop(context);
  }

}

/*

 */
