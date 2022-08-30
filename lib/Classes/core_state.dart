import 'package:flutter/material.dart';

class CoreState {
  final int? counter;
  final Color? bgColor;

  const CoreState({this.counter, this.bgColor});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoreState &&
          runtimeType == other.runtimeType &&
          counter == other.counter &&
          bgColor == other.bgColor;

  @override
  // TODO: implement hashCode
  int get hashCode => counter.hashCode ^ bgColor.hashCode;
}
