import 'package:flutter/material.dart';
import "package:flutter_app/tapdownbutton/raisedbutton.dart";
import "package:flutter_app/NoAnimationMaterialPageRoute.dart";
import "package:flutter_app/NotImplementedScreen.dart";
import "package:flutter_app/buttonlatency/ButtonLatencyScreen.dart";
import "package:flutter_app/heavycomputation/HeavyComputationScreen.dart";
import "package:flutter_app/vibrationlatency/VibrationLatencyScreen.dart";
import "package:flutter_app/listitems/ListDataLoader.dart";
import "package:flutter_app/listitems/ListItemsScreen.dart";

class SelectTestScreen extends StatelessWidget {
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
                _buildNavigationButtons(context),
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
          "assets/images/flutter_logo.png",
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
          "assets/images/flutter_logo.png",
          width: 80.0,
          height: 80.0,
        ),
      ],
    );
  }

  Widget _buildNavigationButtons(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
            width: double.infinity,
            child: RaisedButtonTapDown(
              onPressed: () {
                _gotoButtonDelayScreen(context);
              },
              child: Text("Button delay"),
            )),
        SizedBox(
            width: double.infinity,
            child: RaisedButtonTapDown(
              onPressed: () {
                _gotoLocalListItemsScreen(context);
              },
              child: Text("Local listview"),
            )),
        SizedBox(
            width: double.infinity,
            child: RaisedButtonTapDown(
              onPressed: () {
                _gotoNetworkListItemsScreen(context);
              },
              child: Text("Network listview"),
            )),
        SizedBox(
            width: double.infinity,
            child: RaisedButtonTapDown(
              onPressed: () {
                _gotoHeavyComputationScreen(context);
              },
              child: Text("Heavy computation"),
            )),
        SizedBox(
            width: double.infinity,
            child: RaisedButtonTapDown(
              onPressed: () {
                _gotoVibrationDelayScreen(context);
              },
              child: Text("Vibration delay"),
            )),
        SizedBox(
            width: double.infinity,
            child: RaisedButtonTapDown(
              onPressed: () {
                _gotoNotImplementedScreen(context);
              },
              child: Text("Third party notices"),
            )),
      ],
    );
  }

  void _gotoButtonDelayScreen(BuildContext context) {
    Navigator.push(
        context, NoAnimationMaterialPageRoute(builder: (context) => ButtonLatencyScreen()));
  }

  void _gotoHeavyComputationScreen(BuildContext context) {
    Navigator.push(context, NoAnimationMaterialPageRoute(builder: (context) => HeavyComputationScreen()));
  }

  void _gotoVibrationDelayScreen(BuildContext context) {
    Navigator.push(
        context, NoAnimationMaterialPageRoute(builder: (context) => VibrationLatencyScreen()));
  }

  void _gotoLocalListItemsScreen(BuildContext context) {
    Navigator.push(context, NoAnimationMaterialPageRoute(builder: (context) => ListItemsScreen(title: "Local listview", dataLoader: LocalDataLoader())));
  }

  void _gotoNetworkListItemsScreen(BuildContext context) {
    Navigator.push(context, NoAnimationMaterialPageRoute(builder: (context) => ListItemsScreen(title: "Network listview", dataLoader: NetworkDataLoader())));
  }

  void _gotoNotImplementedScreen(BuildContext context) {
    Navigator.push(context, NoAnimationMaterialPageRoute(builder: (context) => NotImplementedScreen()));
  }
}
