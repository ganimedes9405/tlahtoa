import 'package:flutter/material.dart';
import 'package:educational/widgets/login_button.dart';
import 'package:educational/utils/colors.dart';
// Importamos el archivo del formulario que creamos en el paso anterior
import 'package:educational/screens/login/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Iniciar Sesión',
          // Asegúrate de que kPrimaryGreen esté definido en tu archivo colors.dart
          // Si no, usa: Color(0xFF2EC4B6)
          style: TextStyle(color: kPrimaryGreen, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        // Esto asegura que la flecha de "volver" sea negra o verde, no blanca sobre blanco
        iconTheme: const IconThemeData(color: kPrimaryGreen),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "¿Listo para aprender?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 40),

              // Aquí reutilizamos tu botón existente
              LoginButton(
                onPressed: () {
                  // --- CORRECCIÓN AQUÍ ---
                  // Usamos Navigator para ir a la pantalla del formulario (LoginFormScreen)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginFormScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
