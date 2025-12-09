import 'package:flutter/material.dart';
// import 'package:educational/utils/colors.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  // Usamos el mismo verde del botón principal para mantener la identidad de marca
  static const Color _kMainGreen = Color(0xFF2EC4B6);

  const LoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56, // Misma altura que el botón de Crear Cuenta para simetría
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          // Color del texto y del efecto al presionar (Splash)
          foregroundColor: _kMainGreen,
          // Fondo transparente para que se vea el background crema detrás
          backgroundColor: Colors.transparent,
          // Borde grueso para mantener el estilo "cartoon"
          side: const BorderSide(
            color: _kMainGreen,
            width: 2.5, // 2.5px se ve sólido y moderno
          ),
          shape: RoundedRectangleBorder(
            // Mismo radio de 16 que el botón de Crear Cuenta
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0, // Sin sombra 3D para indicar que es secundario
        ),
        child: Text(
          'YA TENGO UNA CUENTA', // Texto en mayúsculas estilo Duolingo
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold, // Negrita fuerte
            letterSpacing: 1.0, // Espaciado para legibilidad
          ),
        ),
      ),
    );
  }
}
