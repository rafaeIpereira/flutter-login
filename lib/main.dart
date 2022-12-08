// ignore_for_file: unused_import, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project/next_page.dart';
import 'check_page.dart';

import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// class Mainpage extends StatelessWidget {
//   const Mainpage({super.key});

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         body: StreamBuilder<User?>(
//           stream: FirebaseAuth.instance.authStateChanges(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return NextPage();
//             } else {
//               return LoginPage();
//             }
//           },
//         ),
//       );
// }

