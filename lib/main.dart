import 'package:educational/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:educational/screens/home/home_screen.dart';
import 'package:educational/screens/login/login_screen.dart'; // Importa la nueva pantalla

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Educational App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPrimaryGreen, // Usa tu verde mexicano
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(), // Pantalla inicial
      routes: {
        '/login': (context) => const LoginScreen(), // Ahora sí existe
      },
    );
  }
}
