

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_screen.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
    ()=>Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => const LoginScreen())
      ));
    }
  @override
  void dispose(){
    super.dispose();
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Book-It"),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icons8-travel-portal-100.png'),
              Text(
                "Loading",
                style: TextStyle(
                    color: Colors.deepPurple, fontWeight: FontWeight.bold),
              ),
              SpinKitFadingCircle(
                color: Colors.deepPurple,
                size: 50,
                
              )
            ],
          ),
        ));
  }
}

