import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_options.dart';
import 'screens/home.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Sign in anonymously to access protected Firebase data
  await FirebaseAuth.instance.signInAnonymously();

  runApp(const SmartSafetyJacketApp());
}

class SmartSafetyJacketApp extends StatelessWidget {
  const SmartSafetyJacketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Safety Jacket',
      theme: AppTheme.lightTheme,
      home: const Home(),
    );
  }
}