// forgot_password_page.dart
import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  // Future<void> _resetPassword() async {
  //   try {
  //     await FirebaseAuth.instance.sendPasswordResetEmail(
  //       email: _emailController.text.trim(),
  //     );
  //     print("Password reset email sent.");
  //   } catch (e) {
  //     print("Reset failed: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Text("Forget Password",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              Text(
                  "Please enter the email address associated with your account."),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email address"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("Send OTP"),
                onPressed: () {},
              ),
              TextButton(
                child: Text("You remember your password? Sign in"),
                onPressed: () => Navigator.pushNamed(context, '/signin'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
