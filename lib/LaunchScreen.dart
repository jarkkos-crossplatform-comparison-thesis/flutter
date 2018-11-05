import 'package:flutter/material.dart';

class LaunchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter"),
      ),
      body: Center(
        child: Padding(
            padding: EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0),
            child: Column(
              children: <Widget>[
                _buildAppInfoHeader(),
                _buildNavigationButtons(),
              ],
            )),
      ),
    );
  }

  Widget _buildAppInfoHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset(
          "images/flutter_logo.png",
          width: 80.0,
          height: 80.0,
        ),
        Column(
          children: <Widget>[
            Text("Flutter"),
            Text("Version whatever"),
            Text("Select Test"),
          ],
        ),
        Image.asset(
          "images/flutter_logo.png",
          width: 80.0,
          height: 80.0,
        ),
      ],
    );
  }

  Widget _buildNavigationButtons() {
    return Column(
      children: <Widget>[
        SizedBox(
            width: double.infinity,
            child: RaisedButton(
              onPressed: _gotoButtonDelayScreen,
              child: Text("Button delay"),
            )),
        SizedBox(
            width: double.infinity,
            child: RaisedButton(
              onPressed: _gotoNotImplementedScreen,
              child: Text("Local listview"),
            )),
        SizedBox(
            width: double.infinity,
            child: RaisedButton(
              onPressed: _gotoNotImplementedScreen,
              child: Text("Network listview"),
            )),
        SizedBox(
            width: double.infinity,
            child: RaisedButton(
              onPressed: _gotoNotImplementedScreen,
              child: Text("Heavy computation"),
            )),
        SizedBox(
            width: double.infinity,
            child: RaisedButton(
              onPressed: _gotoNotImplementedScreen,
              child: Text("Vibration delay"),
            )),
        SizedBox(
            width: double.infinity,
            child: RaisedButton(
              onPressed: _gotoNotImplementedScreen,
              child: Text("Third party notices"),
            )),
      ],
    );
  }

  void _gotoButtonDelayScreen() {}

  void _gotoNotImplementedScreen() {}
}
