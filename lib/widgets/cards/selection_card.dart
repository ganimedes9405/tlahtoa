import 'package:flutter/material.dart';
import 'package:educational/utils/colors.dart'; // Importamos tus colores

class SelectionCard extends StatelessWidget {
  final String title;
  final IconData icon; // O podrías usar String assetPath para imágenes PNG
  final bool isSelected;
  final VoidCallback onTap;

  const SelectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? kPistache
              : kOffWhite, // Cambio de color al seleccionar
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? kPrimaryGreen : Colors.transparent,
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.brown.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: isSelected ? kPrimaryGreen : Colors.brown[400],
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ), // Margen lateral
              child: Text(
                title,
                textAlign: TextAlign.center, // <--- ESTO CENTRA EL TEXTO
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? kPrimaryGreen : Colors.brown[800],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
