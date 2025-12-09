import 'package:flutter/material.dart';
import 'package:educational/widgets/login_button.dart';
import 'package:educational/widgets/forms/create_account_button.dart';
// 1. IMPORTANTE: Importamos la pantalla del formulario para poder navegar a ella
import 'package:educational/screens/login/login_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // CAPA 1: FONDO
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),

          // CAPA 2: CONTENIDO
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  // --- SECCIÓN VISUAL (Mascota + Logo) ---
                  Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 1. LA MASCOTA
                        Flexible(
                          flex: 6,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.15),
                                  blurRadius: 30,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Image.asset(
                              'assets/images/colibri.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                        const SizedBox(height: 5),

                        // 2. IMAGEN BIENVENIDA
                        Flexible(
                          flex: 4,
                          child: Image.asset(
                            'assets/images/welcome_image.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Texto descriptivo
                  Text(
                    'Conecta con tus raíces',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Rounded',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.brown[800],
                    ),
                  ),

                  const Spacer(flex: 1),

                  // --- SECCIÓN BOTONES ---
                  // 3. BOTÓN PRINCIPAL
                  const CreateAccountButton(),

                  const SizedBox(height: 16),

                  // 4. BOTÓN SECUNDARIO (LOGIN)
                  LoginButton(
                    onPressed: () {
                      // CAMBIO AQUÍ: Navegación directa al formulario
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginFormScreen(),
                        ),
                      );
                    },
                  ),

                  // Margen inferior seguro
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
