// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/firebase_options.dart';
import 'package:fitness_app/service/local_storage.dart';
import 'package:fitness_app/utils/app_theme.dart';
import 'package:fitness_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
  );
  //for loading user preferences : theme and others
  LocalStorage storage = await LocalStorage().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute:AppPages.generateRouteSettings,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('en'), 
        Locale('fr')
      ],
      debugShowCheckedModeBanner: false,
      title: 'MyFitness App',
      theme: AppTheme.theme,
    // home: const Home(),
    );
  }
}

