import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/welcome.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initstate() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = await Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => const WelcomeScreen())
      );
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
          Image.asset('assets/644269.png'),
          Text(
            "Loading",
            style:
                TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
          ),
            SpinKitFadingCircle(
                color: Colors.deepPurple,
                size: 50,
            )
        ],
         
      ),
      )
    );
  }
}
