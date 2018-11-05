import 'package:flutter/material.dart';

class NotImplementedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Not implemented"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'Test not implemented',
            ),
          ],
        ),
      ),
    );
  }
}