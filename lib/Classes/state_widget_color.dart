import 'package:flutter/material.dart';
import 'package:flutterinherit/Classes/core_state.dart';
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
  CoreState state = CoreState();

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
  Widget build(BuildContext context) => StateInheritWidget2(
      child: widget.child,stateWidget: this, state: state,);
//this allow the Statewidget to access the StateInherit
}

class StateInheritWidget2 extends InheritedWidget {
  CoreState state = CoreState();
  final _stateWidgetState stateWidget;

  StateInheritWidget2({
    Key? key,
    required child,
    required this.state,
    required this.stateWidget,

  }) : super(key: key, child: child);


  static _stateWidgetState? of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<StateInheritWidget2>()
      ?.stateWidget;

  @override
  bool updateShouldNotify(StateInheritWidget2 oldWidget) =>
      oldWidget.state != state;
}


