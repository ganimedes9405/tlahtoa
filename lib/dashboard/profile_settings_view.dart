import 'package:flutter/material.dart';
import 'package:educational/utils/colors.dart';

class ProfileSettingsView extends StatelessWidget {
  const ProfileSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCream,
      appBar: AppBar(
        title: const Text(
          "Perfil y Ajustes",
          style: TextStyle(color: Colors.brown),
        ),
        backgroundColor: kCream,
        elevation: 0,
      ),
      body: const Center(
        child: Text(
          'Configuración, Racha y Estadísticas de Tlahtoa.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.brown),
        ),
      ),
    );
  }
}
