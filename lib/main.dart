import 'package:fifa_v1/firebase_options.dart';
import 'package:fifa_v1/pages/home_page.dart';
import 'package:fifa_v1/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: theme,
      debugShowCheckedModeBanner: false, // Optional: Removes debug banner
    );
  }
}
