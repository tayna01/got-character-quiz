import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const GotQuizApp());
}

class GotQuizApp extends StatelessWidget {
  const GotQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GOT Character Quiz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8B0000),
          brightness: Brightness.dark,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}