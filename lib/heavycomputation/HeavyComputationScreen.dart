import 'dart:math';

import "package:flutter_app/tapdownbutton/raisedbutton.dart";
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:async/async.dart';

class HeavyComputationScreen extends StatefulWidget {
  @override
  _HeavyComputationScreenState createState() =>
      new _HeavyComputationScreenState();
}

class _HeavyComputationScreenState extends State<HeavyComputationScreen> {
  ComputationState _computationState = ComputationState.Idle;
  CancelableOperation<List<int>> _computationCancelable;

  @override
  Widget build(BuildContext context) {
    String stateText = "Click to start";
    bool showLoading = false;

    if (_computationState == ComputationState.Computing) {
      stateText = "Computing...";
      showLoading = true;
    } else if (_computationState == ComputationState.Done) {
      stateText = "Done";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Heavy computation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButtonTapDown(
              onPressed: _startComputation,
              child: Text("Click me!"),
            ),
            Text(stateText),
            Visibility(
              child: CircularProgressIndicator(),
              visible: showLoading,
              maintainState: true,
              maintainAnimation: true,
              maintainSize: true,
            )
          ],
        ),
      ),
    );
  }

  void _startComputation() {
    _computationCancelable?.cancel();

    CancelableOperation<List<int>> cancelablePrimes =
        CancelableOperation.fromFuture(compute(findPrimesBelow, 3000000));

    cancelablePrimes.value.then((primes) {
      setState(() {
        _computationState = ComputationState.Done;
        _computationCancelable = null;
      });
    });

    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _computationState = ComputationState.Computing;
      _computationCancelable = cancelablePrimes;
    });
  }
}

List<int> findPrimesBelow(int number) {
  bool isPrimeNumber(int number) {
    if (number == 1) return false;
    if (number == 2) return true;

    final numberSqrt = sqrt(number);
    for (var i = 2; i <= numberSqrt; ++i) {
      if (number % i == 0) return false;
    }

    return true;
  }

  final primes = List<int>();

  for (var i = 1; i < number; ++i) {
    if (isPrimeNumber(i)) {
      primes.add(i);
    }
  }

  return primes;
}

enum ComputationState { Idle, Computing, Done }
