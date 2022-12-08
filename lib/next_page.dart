// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';



class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://i.pinimg.com/736x/8e/ee/04/8eee04aeefee34699b413b5a55079b82.jpg'
            ),
            fit: BoxFit.cover,
          ),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        child: (
          Text(
            'Bem vindo ao mundo tech.',
                style: TextStyle(fontSize: 26, color: Color.fromARGB(255, 255, 253, 253), fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
          )
        )
      ),
    );
  }
}