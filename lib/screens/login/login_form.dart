import 'package:flutter/material.dart';
import 'package:educational/models/login_model.dart';
// Asumimos que tienes el botón verde creado anteriormente.
// Si no, puedes copiar el código del Container del botón aquí mismo.
import 'package:educational/widgets/forms/create_account_button.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passController = TextEditingController();

  // Colores locales (puedes moverlos a colors.dart)
  final Color _kGreen = const Color(0xFF2EC4B6);
  final Color _kBrown = const Color(0xFF5D4037);

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      // 1. Crear el modelo con los datos
      final loginData = LoginModel(
        username: _userController.text,
        password: _passController.text,
      );

      // 2. Validar
      if (loginData.validate()) {
        // ÉXITO
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('¡Bienvenido Tlahtoa!'),
            backgroundColor: Color(0xFF2EC4B6),
          ),
        );
        // Aquí navegarías al Dashboard:
        // Navigator.pushReplacementNamed(context, '/dashboard');
      } else {
        // ERROR
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuario o contraseña incorrectos'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Para que el AppBar flote sobre el fondo
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: _kBrown),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          // 1. FONDO (Mismo que Home)
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),

          // 2. FORMULARIO CON SCROLL
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Título
                      Text(
                        'Iniciar Sesión',
                        style: TextStyle(
                          fontFamily: 'Rounded',
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          color: _kBrown,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '¡Qué bueno verte de nuevo!',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.brown[400],
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 40),

                      // CAMPO USUARIO
                      _buildCustomField(
                        controller: _userController,
                        label: 'Usuario',
                        icon: Icons.person_rounded,
                      ),

                      const SizedBox(height: 20),

                      // CAMPO PASSWORD
                      _buildCustomField(
                        controller: _passController,
                        label: 'Contraseña',
                        icon: Icons.lock_rounded,
                        isPassword: true,
                      ),

                      const SizedBox(height: 40),

                      // BOTÓN DE ACCIÓN (Reutilizamos el estilo del botón verde)
                      // Nota: Cambiamos el texto a "ENTRAR"
                      CreateAccountButton(
                        text: "ENTRAR",
                        onPressed: _handleLogin,
                      ),

                      const SizedBox(height: 20),

                      // Olvidé contraseña
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "¿OLVIDASTE TU CONTRASEÑA?",
                          style: TextStyle(
                            color: _kGreen,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget helper para los campos de texto estilo "Duolingo"
  Widget _buildCustomField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, 4),
            blurRadius: 0,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        decoration: InputDecoration(
          hintText: label,
          hintStyle: TextStyle(color: Colors.grey.shade400),
          prefixIcon: Icon(icon, color: Colors.grey.shade400),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor ingresa tu $label';
          }
          return null;
        },
      ),
    );
  }
}
