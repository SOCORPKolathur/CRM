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
        apiKey: "AIzaSyCU8OyMC0wGN7MJ3ul1S4AqyCmYBhnfASo",
        authDomain: "crmproject-20473.firebaseapp.com",
        projectId: "crmproject-20473",
        storageBucket: "crmproject-20473.appspot.com",
        messagingSenderId: "404234608841",
        appId: "1:404234608841:web:6c9f67eded8d64abc96d18",
        measurementId: "G-VKVZ30XF2D"


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
  debugShowCheckedModeBanner: false,
      home:login_page(),
    );
  }
}
