import 'package:flutter/material.dart';

class ButtonLatencyScreen extends StatefulWidget {
  @override
  _ButtonLatencyScreenState createState() => new _ButtonLatencyScreenState();
}

class _ButtonLatencyScreenState extends State<ButtonLatencyScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button delay"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: _incrementCounter,
              child: Text("Click me!"),
            ),
            Text('$_counter'),
          ],
        ),
      ),
    );
  }
}
