// ignore: file_names
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("connexion"),
        //actions: const [
          //Icon(Icons.more_vert),
        //]
      ),
      // ignore: avoid_unnecessary_containers
      body: SingleChildScrollView(
      child:  Column(
      children: [
      Container(
        alignment: Alignment.center,
        height:300.0,
        child: Lottie.asset("assets/38435-register.json"),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 30.0),
        child: TextFormField(
          decoration: const InputDecoration(
            hintText: 'matricule',
            enabledBorder: OutlineInputBorder(),
            ),
        ),
      ),
      const SizedBox(
        height: 10.0,
      ),
       Container(
        margin: const EdgeInsets.symmetric(horizontal: 30.0),
        child: TextFormField(
          decoration: const InputDecoration(
            hintText: 'Nom',
            enabledBorder: OutlineInputBorder(),
            ),
        ),
      ),
       const SizedBox(
        height: 10.0,
      ),
      ElevatedButton(onPressed: () {}, 
      child: const Text('login')),
      ],
      ),
      ),
    );
  }
} 