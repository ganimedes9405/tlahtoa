import 'package:educational/dashboard/learning_map_view.dart';
import 'package:educational/onboarding/language_select_screen.dart';
import 'package:educational/onboarding/specialization_select_screen.dart';
import 'package:educational/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:educational/screens/home/home_screen.dart';
import 'package:educational/screens/login/login_screen.dart'; // Pantalla intermedia "¿Listo?"
import 'package:educational/screens/login/login_form.dart'; // Tu formulario
// --- IMPORTA TUS NUEVAS PANTALLAS ---

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tlahtoa', // Nombre actualizado
      debugShowCheckedModeBanner: false, // Quita la etiqueta "Debug"
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPrimaryGreen,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Rounded', // Asegúrate de tener la fuente configurada
      ),
      // Ruta inicial
      initialRoute: '/',
      // Definición de Rutas
      routes: {
        '/': (context) => const HomeScreen(),
        '/login_start': (context) => const LoginScreen(), // Pantalla intermedia
        '/login_form': (context) =>
            const LoginFormScreen(), // Tu formulario actual
        '/area_select': (context) =>
            const SpecializationSelectScreen(), // ¿Cuál es tu área?
        '/language_select': (context) =>
            const LanguageSelectScreen(), // Elige idioma
        '/dashboard': (context) =>
            const LearningMapView(), // Mapa de aprendizaje
      },
    );
  }
}
