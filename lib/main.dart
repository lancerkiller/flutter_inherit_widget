import 'package:flutter/material.dart';
import 'package:flutterinherit/counter_page.dart';
import 'package:flutterinherit/state_widget.dart';
import 'package:intl/intl.dart';

import 'Data.dart';
import 'Data_Second_Screen/_ClassSecondScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final DATA_FOR_SECONDSCREEN = Data("lancer", 1, "$now");
    return stateWidget(
        // name: "lancer killer",
        //  data: DATA_FOR_SECONDSCREEN,
        child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final counter = StateInheritWidget.of(context)?.counter;
    final now = DateTime.now();
    final DATA_FOR_SECONDSCREEN = Data("lancer", 1, "$now");

    print(_formKey);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'INHERIT WIDGET: ${counter}   ',
              style: TextStyle(fontSize: 40.0),
            ),
            //${state_widget_data?.data.dateTime}  ${state_widget_data?.name}  ${state_widget_data?.name}
            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CounterPage()));
              },
              child: Text("button Next Page"),
            ),
            TextFormField(
              decoration:
                  const InputDecoration(hintText: "DONT TYPE ANYTHING HERE"),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ClassSecondScreen(data: DATA_FOR_SECONDSCREEN)));
              },
              child: Text("Pass Through Class"),
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        if (_formKey.currentState!.validate()) {
                          // Process data.
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
