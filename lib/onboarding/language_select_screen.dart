import 'package:flutter/material.dart';
import 'package:educational/utils/colors.dart';
import 'package:educational/widgets/cards/selection_card.dart';

class LanguageSelectScreen extends StatefulWidget {
  const LanguageSelectScreen({super.key});

  @override
  State<LanguageSelectScreen> createState() => _LanguageSelectScreenState();
}

class _LanguageSelectScreenState extends State<LanguageSelectScreen> {
  int _selectedIndex = -1;

  // Función para manejar la selección y navegación
  void _handleSelection(int index) async {
    setState(() => _selectedIndex = index);

    // Pequeña pausa para que el usuario vea la selección visual (feedback)
    await Future.delayed(const Duration(milliseconds: 300));

    // --- REPARACIÓN DE LINTER: Usamos 'mounted' de la clase State ---
    if (!mounted) return;

    // Navegar al MainContainerScreen y eliminar el historial anterior
    Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (route) => false);
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
