import 'package:flutter/material.dart';
import 'screens/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biblioteca de Livros',
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
