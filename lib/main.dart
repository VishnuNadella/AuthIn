import 'package:authin/firebase_options.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:authin/screens/scanner.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AuthIn',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'AuthIn'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final db = FirebaseFirestore.instance;
  // String Name = "";
  // var user = <String, dynamic>{
  //   "Name": "",
  //   "born": 1815,
  // };

  // _addData(var user) {
  //   db.collection("users").add(user).then((DocumentReference doc) =>
  //       print('DocumentSnapshot added with ID: ${doc.id}'));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Scanner(),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       const Text("data"),
      //       TextField(
      //         onChanged: (text) {
      //           setState(() {
      //             Name = text;
      //           });
      //         },
      //         decoration: const InputDecoration(
      //           border: InputBorder.none,
      //           labelText: 'Enter Name',
      //           hintText: 'Enter Your Name',
      //         ),
      //       ),
      //       Container(
      //         child: TextButton(
      //           onPressed: () {
      //             setState(() {
      //               user["Name"] = Name;
      //             });
      //             _addData(user);
      //           },
      //           child: const Text("Enter data"),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
