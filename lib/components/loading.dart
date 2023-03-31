import 'package:flutter/material.dart';
import "package:flutter_spinkit/flutter_spinkit.dart";

class Loading  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container (
      color: Colors.brown[100],
      child: const Center (
        child: SpinKitWave(
          color: Color.fromARGB(255, 68, 102, 185),
          size: 50.0,
        )
      )
    );
  }
}