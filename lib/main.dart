import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/splashscreen.dart';
import 'services/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(
    null, 
    [
      NotificationChannel(
        channelKey: 'key1', 
        channelName: 'Book-it', 
        channelDescription: 'Notification',
        defaultColor: Color(0xFF4E888F),
        playSound: true,
        enableVibration: true
        )
    ]
    );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter demo",
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 78, 136, 143)),
          // ignore: prefer_const_constructors
          scaffoldBackgroundColor: Color.fromARGB(255, 231, 231, 231)
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
