import 'package:flutter/material.dart';
import 'package:intruder_detector/homePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'entryScreen.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intruder Detector',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.deepPurple.shade50,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple.shade400,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        '/notification': (context) => const EntryScreen(),
      },
    );
  }
}
