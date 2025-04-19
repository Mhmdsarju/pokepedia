import 'package:app6/screens/homescreen.dart';
import 'package:app6/screens/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Pokedex());
}

class Pokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth UI',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/signin',
      home: FirebaseAuth.instance.currentUser != null ? Home() : SignInPage(),
    );
  }
}
