import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

searchInDb(String uid) async {
  final db = FirebaseFirestore.instance;
  final CollectionReference _collection = db.collection("event");

  print(
      "Data: ${_collection.where("id", isEqualTo: uid.trim()).get()}, ${uid.trim()}");
  var finalData;
  try {
    finalData = await _collection.where("id", isEqualTo: uid.trim()).get().then(
      (event) async {
        var reqDoc;
        var prsnId;
        var prsnData;
        print("event: ${event.docs}");
        for (var doc in event.docs) {
          reqDoc = doc;
        }
        print("required doc: $reqDoc");
        prsnId = reqDoc.id;
        prsnData = reqDoc.data();

        if (!prsnData["Attended"]) {
          await _collection.doc(prsnId).update({"Attended": true});
          await _collection
              .doc(prsnId)
              .update({"date_time_of_scan": DateTime.now().toString()});
          return ["true", prsnData["Name"]];
        } else if (prsnData["Attended"]) {
          return ["false", prsnData["Name"]];
        } else {
          return ["", ""];
        }
      },
    );
  } catch (e) {
    finalData = ["none", ""];
  }
  ;
  return finalData;
}
