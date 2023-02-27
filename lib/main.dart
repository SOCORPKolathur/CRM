import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Login_page/login_page.dart';
import 'demo.dart';
import 'mgtv.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:FirebaseOptions(
        apiKey: "AIzaSyCtYQ4GPAlKARRReabwnLcvBw4664eYOGk",
        authDomain: "crmrankraze-f7c0b.firebaseapp.com",
        projectId: "crmrankraze-f7c0b",
        storageBucket: "crmrankraze-f7c0b.appspot.com",
        messagingSenderId: "656600659780",
        appId: "1:656600659780:web:5854effe1b70311e80c911",
        measurementId: "G-0XYGBD844F"
    )
  );
  runApp(const MyApp());

  final CollectionReference user=FirebaseFirestore.instance.collection('Users');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: const Color(0xff5F67EC),
        ),
      ),
  debugShowCheckedModeBanner: false,
      home:login_page(),
    );
  }
}
