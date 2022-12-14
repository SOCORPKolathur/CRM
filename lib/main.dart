import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:webpage/profile.dart';
import 'package:webpage/slidenavbar.dart';

import 'dash2.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:FirebaseOptions(
        apiKey: "AIzaSyCgRYzFItA5hbKOpG6uPSXPdnLw2akJeA4",
        authDomain: "crm-project-7fbf9.firebaseapp.com",
        projectId: "crm-project-7fbf9",
        storageBucket: "crm-project-7fbf9.appspot.com",
        messagingSenderId: "455655240292",
        appId: "1:455655240292:web:2eb39650914d121400e571",
        measurementId: "G-L0J79D5JGN"

    )
  );
  runApp(MyApp());

  final CollectionReference user=FirebaseFirestore.instance.collection('Users');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner: false,
      home: Dash2(),
    );
  }
}
