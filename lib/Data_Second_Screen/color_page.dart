import 'package:flutter/material.dart';

import '../state_widget.dart';

class ColorPage extends StatelessWidget {
  const ColorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Color Plate"),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildColorButton(context, Colors.red),
              buildColorButton(context, Colors.blue),
              buildColorButton(context, Colors.green),
              buildColorButton(context, Colors.black26),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildColorButton(BuildContext context, Color color) => Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: color, elevation: 0),
            onPressed: () {
              final provider = StateInheritWidget.of(context);
              provider?.changeColor(color);
              Navigator.pop(context);
            },
            child: Container(
              height: 120,
              child: Center(
                  child: Text(
                "Color Plate ",
              )),
            )),
      );
}
