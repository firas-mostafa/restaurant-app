import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restoorder/firebase_options.dart';
import 'package:restoorder/provider/services/auth/login_or_register.dart';
import 'package:restoorder/provider/services/auth/auth_gate.dart';
import 'package:restoorder/provider/services/auth/auth_services.dart';
import 'package:restoorder/provider/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'provider/payment_provider.dart';
import 'provider/restaurant.dart';
import 'provider/services/database/firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ObscureProvider()),
        ChangeNotifierProvider(create: (context) => AuthServices()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => FirestoreService()),
        ChangeNotifierProvider(create: (context) => Restaurant()),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PayMentProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeAnimationCurve: Curves.easeInCubic,
        themeAnimationDuration: const Duration(milliseconds: 300),
        theme: Provider.of<ThemeProvider>(context).themData,
        debugShowCheckedModeBanner: false,
        home: const AuthGate());
  }
}
