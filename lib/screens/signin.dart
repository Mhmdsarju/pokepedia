import 'package:app6/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Navigate to home or success page
    } catch (e) {
      print("Login failed: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Container(
                height: 100,
                width: 200,
                child: Lottie.asset("assets/lote1.json"),
              ),
              Text("Sign In",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "User name"),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text("Forget password"),
                  onPressed: () => Navigator.pushNamed(context, '/forgot'),
                ),
              ),
              ElevatedButton(
                child: Text("Login"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                } /*_signIn*/,
              ),
              Text("Or Continue with"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      child: Text("Google"),
                      onPressed: () {/* Google login */}),
                  SizedBox(width: 10),
                  ElevatedButton(
                      child: Text("Facebook"),
                      onPressed: () {/* Facebook login */}),
                ],
              ),
              TextButton(
                child: Text("Haven't any account? Sign up"),
                onPressed: () => Navigator.pushNamed(context, '/signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
