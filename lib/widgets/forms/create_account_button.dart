import 'package:flutter/material.dart';
// Si ya tienes tus colores definidos, impórtalos:
// import 'package:educational/utils/colors.dart';

class CreateAccountButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  // Definimos los colores aquí temporalmente para que el widget sea independiente.
  // IDEALMENTE: Mueve estos a tu archivo colors.dart.
  // Este es el verde vibrante del cuerpo del colibrí.
  static const Color _kMainGreen = Color(0xFF2EC4B6);
  // Esta es una versión más oscura del mismo verde para la sombra 3D.
  static const Color _kShadowGreen = Color(0xFF1F8A7F);

  const CreateAccountButton({
    super.key,
    this.onPressed,
    this.text = "EMPEZAR AHORA", // Texto por defecto
  });

  @override
  Widget build(BuildContext context) {
    // Usamos GestureDetector + Container para un control total del diseño 3D.
    // ElevatedButton estándar no permite fácilmente este tipo de sombra sólida.
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity, // Ocupa todo el ancho disponible
        height: 56, // Altura estándar cómoda para el pulgar
        decoration: BoxDecoration(
          color: _kMainGreen, // Color principal del botón
          borderRadius: BorderRadius.circular(16), // Bordes muy redondeados
          // AQUÍ ESTÁ LA MAGIA DEL EFECTO DUOLINGO:
          boxShadow: [
            BoxShadow(
              color: _kShadowGreen, // Color de la sombra (verde oscuro)
              offset: const Offset(
                0,
                4,
              ), // Desplaza la sombra hacia abajo 4 pixeles
              blurRadius:
                  0, // CRÍTICO: 0 blur hace que la sombra sea sólida, no borrosa
            ),
          ],
        ),
        child: Center(
          child: Text(
            text.toUpperCase(), // Texto en mayúsculas para más impacto
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              // Usa la fuente más gruesa que tengas disponible.
              // Si tienes GoogleFonts configurado, usa fontWeight: FontWeight.w800
              fontWeight: FontWeight.bold,
              letterSpacing:
                  1.2, // Un poco de espacio entre letras ayuda a la legibilidad
            ),
          ),
        ),
      ),
    );
  }
}
