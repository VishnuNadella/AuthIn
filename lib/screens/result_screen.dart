import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Result extends StatelessWidget {
  Result({
    required this.name,
    required this.status,
  });
  final String name;
  final String status; // 3=> True, Duplicate, Invalid / Non Existent

  static String id = "/result";
  String scannerData = "";
  @override
  void initState() {
    scannerData = name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              status == "true"
                  ? "assets/lottie/success.json"
                  : status == "false"
                      ? "assets/lottie/error.json"
                      : status == "none"
                          ? "assets/lottie/notFound.json"
                          : "assets/lottie/unknownError.json",
              width: 200.0,
              height: 200.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 200.0,
            width: 360,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  (status == "true"
                      ? '\nWelcome\n\n$name'
                      : status == "false"
                          ? '\nDuplicate\n\n$name'
                          : status == "none"
                              ? "\nNo id exists"
                              : "\nUnknown Error"),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
              ],
            )),
          ),

          // Update the below containers
          const SizedBox(
            height: 48.0,
          ),

          TextButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 43, 95, 224)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return Color.fromARGB(255, 43, 95, 224).withOpacity(0.04);
                  }
                  if (states.contains(MaterialState.focused) ||
                      states.contains(MaterialState.pressed)) {
                    return Color.fromARGB(255, 43, 95, 224).withOpacity(0.12);
                  }
                  return null; // Defer to the widget's default.
                },
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
              child: Text('Next'),
            ),
          ),
          // Container(child: Text('Checking Status: $scannerStatus')),
        ],
      ),
    ));
  }
}
