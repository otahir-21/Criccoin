
import 'package:criccoin/BasicDetail.dart';
import 'package:criccoin/Splash/Splash-1.dart';
import 'package:criccoin/firebase_options.dart';
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
      title: 'Criccoin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),
      home: const Splash1(),
    );
  }
}
