import 'package:at_the_rate_of_connectify/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
      ),
    );

    return MaterialApp(
      title: '@Connectify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
