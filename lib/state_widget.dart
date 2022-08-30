import 'package:flutter/material.dart';

import 'Data.dart';

//statefull widget to update the counter

class stateWidget extends StatefulWidget {
  final Widget child;

  const stateWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<stateWidget> createState() => _stateWidgetState();
}

class _stateWidgetState extends State<stateWidget> {
  //because counter at staless cannot change and we make it final and now the counter here can update
  //because it is stafull
  int counter = 0;
  Color color = Colors.red;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void changeColor(Color color){
    setState(() {
      this.color = color;
    });
  }

  @override
  Widget build(BuildContext context) => StateInheritWidget(
      child: widget.child, counter: counter, color: color, stateWidget: this);
//this allow the Statewidget to access the StateInherit
}

class StateInheritWidget extends InheritedWidget {
  final int? counter;
  final Color? color;

  //final String? name;
  //final Data data;

  final _stateWidgetState stateWidget;

/*
//for statefull which require statefull widget
  StateInheritWidget(
      {Key? key,
        required child,
        required this.counter,
        required this.stateWidget})
      : super(key: key, child: child);

 */

  StateInheritWidget({
    Key? key,
    required child,
    required this.counter,
    required this.color,
    required this.stateWidget,
    //required this.name,
    //required this.data,
  }) : super(key: key, child: child);

  //make sure it is inherit
  //now this only return the final int counter over which mean to say the staless widget
  //ask it to return ti stateWidgetForStatfull then only acess to -> counter

  /*
  static of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<StateInheritWidget>()?.data;

   */

  static _stateWidgetState? of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<StateInheritWidget>()
      ?.stateWidget;

  @override
  bool updateShouldNotify(StateInheritWidget oldWidget) =>
      oldWidget.color != color;
}

/*
class StateWidget extends StatefulWidget {
  final Widget child;

  const StateWidget({Key? key, required this.child, required int counter})
      : super(key: key);

  @override
  State<StateWidget> createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return StateInheritWidget(counter: counter, stateWidgetForStafull:this, child: widget);
  }

  void incrementCounter() {
    counter=counter+1;
  }
}

 */
