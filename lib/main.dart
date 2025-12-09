import 'package:educational/chatbot_loop/chat_interface_screen.dart';
import 'package:educational/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:educational/screens/home/home_screen.dart';
import 'package:educational/screens/login/login_screen.dart';
import 'package:educational/screens/login/login_form.dart';

// --- PANTALLAS DE ONBOARDING ---
import 'package:educational/onboarding/specialization_select_screen.dart';
import 'package:educational/onboarding/language_select_screen.dart';

// --- NUEVO SHELL DEL DASHBOARD (Etapa 1) ---
// La LearningMapView se importa ahora dentro de MainContainerScreen.
import 'package:educational/dashboard/main_container_screen.dart';
import 'package:educational/learning_loop/video_player_view.dart';

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
      initialRoute: '/',
      // Definición de Rutas
      routes: {
        '/': (context) => const HomeScreen(),
        '/login_start': (context) => const LoginScreen(),
        '/login_form': (context) => const LoginFormScreen(),
        '/area_select': (context) => const SpecializationSelectScreen(),
        '/language_select': (context) => const LanguageSelectScreen(),

        // --- RUTA CORREGIDA: Apunta al contenedor principal (Navbar) ---
        '/dashboard': (context) => const MainContainerScreen(),
        '/video_player_view': (context) => const VideoPlayerView(),
        '/chatbot_interface': (context) => const ChatInterfaceScreen(),
      },
    );
  }
}
