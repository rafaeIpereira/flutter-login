// ignore_for_file: annotate_overrides, prefer_const_constructors, sort_child_properties_last, unused_import, unused_catch_clause, empty_catches, unused_local_variable, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'check_page.dart';

import 'next_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passwordController.dispose();

  //   super.dispose();
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(233, 30, 34, 88),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
              SizedBox(
                height: 18,
              ),
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(108, 217, 220, 221)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(hintText: "E-mail"),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(hintText: "Password"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.lightBlueAccent[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(
                        'Logar',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      onPressed: () {
                        signIn();
                      })),
              SizedBox(
                height: 15,
              ),
              TextButton(
                child: Text('Esqueceu sua senha?'),
                onPressed: (() {}),
              )
            ],
          ),
        ),
      ),
    );
  }

  signIn() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (userCredential != null) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NextPage(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuário não encontrado'),
            backgroundColor: Colors.redAccent,
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sua senha está errada'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }
  //  Future signIn() async {
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //     email: emailController.text.trim(),
  //     password: passwordController.text.trim(),
  //   );
  // }
}
