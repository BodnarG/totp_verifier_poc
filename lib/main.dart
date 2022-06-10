import 'package:flutter/material.dart';
import 'package:totp_verifier_poc/view/home_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vokabular',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF1F2021),
          secondary: Color(0xFF237160),
        ),
        scaffoldBackgroundColor: const Color(0xFF2B2B2B),
        toggleableActiveColor: const Color(0xFF237160),
        indicatorColor: const Color(0xFF237160),
        cardTheme: const CardTheme(
          color: Color(0xFF444444),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: HomeWidget(),
    );
  }
}
