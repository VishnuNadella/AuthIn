import 'package:flutter/material.dart';



const String dbPwd = "vQPGHjKPc03egAjY";
const String usn = "authintech";

// const String MONGO_URL = "mongodb+srv://$usn:$dbPwd@tedxiare.xelovad.mongodb.net/events?retryWrites=true&w=majority";
const String MONGO_URL = "mongodb+srv://authintech:$dbPwd@bits.vpz7ldf.mongodb.net/ecellHyderabad?retryWrites=true&w=majority";
const String COLLECTION_NAME = "launchpad23";



const KTextFieldDecoration = InputDecoration(
  
  hintText: 'Enter your email',
  
  contentPadding:
      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
        BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
