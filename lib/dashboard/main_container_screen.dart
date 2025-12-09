import 'package:flutter/material.dart';
import 'package:educational/utils/colors.dart';
import 'package:educational/dashboard/learning_map_view.dart';
import 'package:educational/dashboard/glossary_view.dart';
import 'package:educational/dashboard/profile_settings_view.dart';

class MainContainerScreen extends StatefulWidget {
  const MainContainerScreen({super.key});

  @override
  State<MainContainerScreen> createState() => _MainContainerScreenState();
}

class _MainContainerScreenState extends State<MainContainerScreen> {
  int _currentIndex = 0;

  final List<Widget> _views = [
    const LearningMapView(),
    const GlossaryView(),
    const ProfileSettingsView(),
  ];

  void _onItemTapped(int index) {
    // Si se presiona el FAB (index 1), no cambiamos de vista, solo lanzamos la acción.
    if (index == 1) return;

    // Ajustamos el índice real para las vistas (0, 2, 3)
    final newIndex = index > 1 ? index - 1 : index;

    setState(() {
      _currentIndex = newIndex;
    });
  }

  // Lógica para el botón central de Chatbot
  void _openChatbot() {
    // Aquí pondrías el modal o navegarías a la interfaz de chat (Etapa 4)
    showModalBottomSheet(
      context: context,
      backgroundColor: kPrimaryGreen,
      builder: (context) => const SizedBox(
        height: 250,
        child: Center(
          child: Text(
            '🤖 Chatbot activado!\n(Implementación en Etapa 4)',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Usamos IndexedStack para mantener el estado de las vistas (ej: el scroll del mapa)
      body: IndexedStack(index: _currentIndex, children: _views),

      // Botón Central Flotante (Colibrí/Chatbot)
      floatingActionButton: FloatingActionButton(
        onPressed: _openChatbot,
        backgroundColor: kPrimaryGreen,
        shape: const CircleBorder(),
        elevation: 8,
        child: Image.asset(
          'assets/images/colibri.png', // Usa tu imagen del colibrí
          height: 36,
        ),
      ),

      // Posición del FAB (centrado)
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Navbar Flotante
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(), // Crea el notch para el FAB
        notchMargin: 8.0, // Espacio entre FAB y barra
        color: kLimeMexicano, // Color de la barra
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 0: Mapa (LearningMapView)
              _buildNavItem(0, Icons.map, "Mapa"),

              // 1: Espacio vacío para el FAB
              const SizedBox(width: 40),

              // 2: Glosario (GlossaryView)
              _buildNavItem(2, Icons.menu_book, "Glosario"),

              // 3: Perfil (ProfileSettingsView)
              _buildNavItem(3, Icons.person, "Perfil"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final bool isSelected =
        (index == 0 && _currentIndex == 0) ||
        (index == 2 && _currentIndex == 1) ||
        (index == 3 && _currentIndex == 2);

    return IconButton(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? kPrimaryGreen : Colors.brown[400],
            size: 26,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? kPrimaryGreen : Colors.brown[400],
            ),
          ),
        ],
      ),
      onPressed: () => _onItemTapped(index),
    );
  }
}
