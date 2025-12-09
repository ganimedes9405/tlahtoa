import 'package:flutter/material.dart';
import 'package:educational/models/login_model.dart';
import 'package:educational/widgets/forms/create_account_button.dart';
// Asegúrate de importar tu archivo de colores si quieres usar las constantes globales
// import 'package:educational/utils/colors.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passController = TextEditingController();

  // Colores locales
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
        // --- ÉXITO ---
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('¡Bienvenido a Tlahtoa!'),
            backgroundColor: Color(0xFF2EC4B6),
            duration: Duration(seconds: 1), // Duración corta
          ),
        );

        // --- NAVEGACIÓN ---
        // Usamos un pequeño delay para que se vea el SnackBar (opcional)
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            // Redirige a la pantalla de "¿Cuál es tu área?"
            // pushReplacementNamed borra el login del historial para que no puedan volver atrás
            Navigator.pushReplacementNamed(context, '/area_select');
          }
        });
      } else {
        // --- ERROR ---
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
      extendBodyBehindAppBar: true,
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
          // 1. FONDO
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),

          // 2. FORMULARIO
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
                          fontFamily:
                              'Rounded', // Asegúrate de que coincida con tu pubspec.yaml
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

                      // Campo Usuario
                      _buildCustomField(
                        controller: _userController,
                        label: 'Usuario',
                        icon: Icons.person_rounded,
                      ),

                      const SizedBox(height: 20),

                      // Campo Contraseña
                      _buildCustomField(
                        controller: _passController,
                        label: 'Contraseña',
                        icon: Icons.lock_rounded,
                        isPassword: true,
                      ),

                      const SizedBox(height: 40),

                      // Botón Entrar
                      CreateAccountButton(
                        text: "ENTRAR", // Texto personalizado
                        onPressed: _handleLogin,
                      ),

                      const SizedBox(height: 20),

                      // Olvidé contraseña
                      TextButton(
                        onPressed: () {
                          // Acción futura para recuperar contraseña
                        },
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
            // Compatible con Flutter moderno (evita warning de withOpacity)
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
