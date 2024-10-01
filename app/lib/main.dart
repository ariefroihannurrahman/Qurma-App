import 'package:app/firebase_options.dart';
import 'package:app/pages/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qurma App',
      routes: {
        '/': (context) => const SignInWithGoogle(),
      },
      initialRoute: '/',  // Set HomePage sebagai halaman awal
    );
  }
}
