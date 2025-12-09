import 'package:educational/learning_loop/exercise_engine_screen.dart';
import 'package:educational/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:educational/screens/home/home_screen.dart';
import 'package:educational/screens/login/login_screen.dart';
import 'package:educational/screens/login/login_form.dart';

// --- IMPORTACIONES RESTAURADAS ---
import 'package:educational/onboarding/specialization_select_screen.dart';
import 'package:educational/onboarding/language_select_screen.dart';
import 'package:educational/dashboard/main_container_screen.dart'; // Etapa 1: Shell principal
import 'package:educational/learning_loop/video_player_view.dart'; // Etapa 3: Video
import 'package:educational/chatbot_loop/chat_interface_screen.dart'; // Etapa 4: Chatbot
// --------------------------------

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tlahtoa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPrimaryGreen,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Rounded',
      ),
      // Ruta inicial
      initialRoute: '/',
      // Definición de Rutas
      routes: {
        '/': (context) => const HomeScreen(),
        '/login_start': (context) => const LoginScreen(),
        '/login_form': (context) => const LoginFormScreen(),
        '/area_select': (context) => const SpecializationSelectScreen(),
        '/language_select': (context) => const LanguageSelectScreen(),

        // --- RUTAS DE NAVEGACIÓN RESTAURADAS ---
        '/dashboard': (context) =>
            const MainContainerScreen(), // Ahora es el Shell
        '/video_player_view': (context) => const VideoPlayerView(), // Etapa 3
        '/chatbot_interface': (context) =>
            const ChatInterfaceScreen(), // Etapa 4
        // ---------------------------------------
        '/quiz_engine_screen': (context) => const ExerciseEngineScreen(),
      },
    );
  }
}
