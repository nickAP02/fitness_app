import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/components/auth/signup_page.dart';
import 'package:fitness_app/firebase_options.dart';
import 'package:fitness_app/utils/app_theme.dart';
import 'package:flutter/material.dart';

void main() async {
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
      debugShowCheckedModeBanner: false,
      title: 'MyFitness App',
      theme: theme,
      home: const SignUp(),
    );
  }
}

