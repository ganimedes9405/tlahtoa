import 'package:flutter/material.dart';
import 'package:educational/widgets/login_button.dart';
import 'package:educational/widgets/forms/create_account_button.dart';
// Se eliminó el import de colors.dart que no se usaba

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
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 20.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 1),

                  // 1. LA MASCOTA
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          // CORRECCIÓN: Usamos withValues en lugar de withOpacity
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 30,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/colibri.png',
                      height: 220,
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 2. LOGO / IMAGEN BIENVENIDA
                  Image.asset(
                    'assets/images/welcome_image.png',
                    height: 200,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(height: 10),

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

                  const Spacer(flex: 2),

                  // 3. BOTÓN PRINCIPAL
                  const CreateAccountButton(),

                  const SizedBox(height: 16),

                  // 4. BOTÓN SECUNDARIO
                  LoginButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
