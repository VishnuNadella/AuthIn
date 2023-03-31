import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../components/loading.dart';
import "./result_screen.dart";
import "../firebase.dart";

class Scanner extends StatefulWidget {
  static String id = "/scan";
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  String scannerData = "";
  late String scannerStatus;
  late String Status;
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    scannerData = "";
    Status = "Please Scan to check status";
    scannerStatus = Status;
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    height: 300,
                    width: 300,
                    child: MobileScanner(
                        allowDuplicates: false,
                        onDetect: (barcode, args) async {
                          if (barcode.rawValue == null) {
                            debugPrint('Failed to scan Barcode');
                          } else {
                            final String code = barcode.rawValue!;

                            if (code != "") {
                              setState(() {
                                scannerData = code;
                                // scannerData = "225abfbc7beac80fb964ee28";
                                scannerStatus = Status;
                              });
                            }
                            debugPrint('Barcode found! $scannerData');
                          }
                        }),
                  ),
                ),
                const SizedBox(
                  height: 48.0,
                ),

                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 43, 95, 224),
                    ),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Color.fromARGB(255, 43, 95, 224)
                              .withOpacity(0.4);
                        }
                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed)) {
                          return Color.fromARGB(255, 43, 95, 224)
                              .withOpacity(0.12);
                        }
                        return null; // Defer to the widget's default.
                      },
                    ),
                  ),
                  onPressed: () async {
                    if (scannerData != "") {
                      setState(() {
                        loading = true;
                      });
                      List req_data = await searchInDb(scannerData);
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => Result(
                            name: req_data[1],
                            status: req_data[0]
                          ),
                        ),
                      );
                      setState(
                        () {
                          scannerData = "";
                          loading = false;
                        },
                      );
                    } else {}
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                    child: Text('Authenticate'),
                  ),
                ),

                // Update the below containers
                const SizedBox(
                  height: 48.0,
                ),
                Container(
                  height: 100,
                  width: 300,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    color: Colors.black12,
                  ),
                  child: Center(
                    child: Text(
                      scannerData,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                // Container(child: Text('Checking Status: $scannerStatus')),
              ],
            ),
          ));
  }
}
