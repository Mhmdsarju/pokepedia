import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  Future<void> _signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Optionally update display name, store more data in Firestore
    } catch (e) {
      print("Sign up failed: $e");
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
              Text("Sign Up",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Full name"),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email address"),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
              ),
              Text("By signing up, you agree to our Terms & Privacy."),
              ElevatedButton(
                child: Text("Create Account"),
                onPressed: () {},
              ),
              TextButton(
                child: Text("Already have an Account? Sign in"),
                onPressed: () => Navigator.pushNamed(context, '/signin'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
