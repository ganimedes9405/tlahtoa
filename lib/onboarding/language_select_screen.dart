import 'package:flutter/material.dart';
import 'package:educational/utils/colors.dart';
// Asegúrate de tener este widget creado como lo definimos en la etapa anterior
import 'package:educational/widgets/cards/selection_card.dart';

class LanguageSelectScreen extends StatefulWidget {
  const LanguageSelectScreen({super.key});

  @override
  State<LanguageSelectScreen> createState() => _LanguageSelectScreenState();
}

class _LanguageSelectScreenState extends State<LanguageSelectScreen> {
  int _selectedIndex = -1;

  // Función para manejar la selección y navegación
  void _handleSelection(int index) {
    setState(() => _selectedIndex = index);

    // Pequeña pausa para que el usuario vea la selección visual (feedback)
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        // Navegar al mapa principal y eliminar el historial anterior
        // (Login, Selección de Área, etc.)
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/dashboard',
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCream, // Fondo beige suave
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Barra de progreso opcional o botón atrás
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.brown[800],
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "Elige tu Idioma",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Rounded',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[900],
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "¿Qué quieres aprender hoy?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.brown[600]),
              ),

              const SizedBox(height: 50),

              // Opción 1: Inglés Técnico
              SizedBox(
                height: 140,
                child: SelectionCard(
                  title: "Inglés Técnico",
                  // Puedes cambiar este Icon por un Image.asset si tienes banderas
                  icon: Icons.settings_suggest_rounded,
                  isSelected: _selectedIndex == 0,
                  onTap: () => _handleSelection(0),
                ),
              ),

              const SizedBox(height: 24),

              // Opción 2: Náhuatl Funcional
              SizedBox(
                height: 140,
                child: SelectionCard(
                  title: "Náhuatl Funcional",
                  icon: Icons.record_voice_over_rounded,
                  isSelected: _selectedIndex == 1,
                  onTap: () => _handleSelection(1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
