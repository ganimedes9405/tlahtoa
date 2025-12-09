import 'package:flutter/material.dart';
import 'package:educational/utils/colors.dart';

class LearningMapView extends StatelessWidget {
  const LearningMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCream,
      appBar: AppBar(
        title: const Text(
          "Tu Camino Profesional",
          style: TextStyle(color: Colors.brown),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // CAPA 1: EL CAMINO PUNTEADO (Dibujado detrás)
              CustomPaint(
                size: const Size(
                  double.infinity,
                  600,
                ), // Altura estimada del mapa
                painter: RoadMapPainter(),
              ),

              // CAPA 2: LOS NIVELES (Botones circulares)
              Column(
                children: [
                  _buildLevelNode(
                    "Conceptos\nClave",
                    true,
                    0,
                  ), // Nivel 1 (Activo)
                  const SizedBox(height: 80), // Espacio para la curva
                  _buildLevelNode(
                    "Vocabulario\nTécnico",
                    false,
                    1,
                    isLeft: false,
                  ), // Nivel 2 (Derecha)
                  const SizedBox(height: 80),
                  _buildLevelNode(
                    "Prefijos\nRaíces",
                    false,
                    2,
                  ), // Nivel 3 (Izquierda)
                  const SizedBox(height: 80),
                  _buildLevelNode("Examen\nFinal", false, 3, isLeft: false),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper para crear los círculos de los niveles
  Widget _buildLevelNode(
    String title,
    bool isUnlocked,
    int index, {
    bool isLeft = true,
  }) {
    // Desplazamiento horizontal para dar efecto de "zig-zag"
    final double horizontalOffset = isLeft ? -60.0 : 60.0;

    return Transform.translate(
      offset: Offset(horizontalOffset, 0),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: isUnlocked ? kPrimaryGreen : Colors.grey[400],
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
              border: Border.all(color: Colors.white, width: 4),
            ),
            child: Icon(
              isUnlocked ? Icons.star : Icons.lock,
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.brown[800],
            ),
          ),
        ],
      ),
    );
  }
}

// Lógica para dibujar la línea curva punteada
class RoadMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.brown.withValues(alpha: 0.3)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round; // Puntos redondos

    final path = Path();

    // Coordenadas aproximadas para conectar los nodos en zig-zag
    // Inicio (Centro arriba)
    path.moveTo(size.width * 0.5 - 60, 40);

    // Curva hacia la derecha
    path.quadraticBezierTo(
      size.width * 0.2,
      120, // Punto de control
      size.width * 0.5 + 60,
      160, // Destino (Nivel 2)
    );

    // Curva hacia la izquierda
    path.quadraticBezierTo(
      size.width * 0.8,
      260,
      size.width * 0.5 - 60,
      300, // Destino (Nivel 3)
    );

    // Curva hacia la derecha final
    path.quadraticBezierTo(
      size.width * 0.2,
      400,
      size.width * 0.5 + 60,
      440, // Destino (Nivel 4)
    );

    // Dibujamos la línea (aquí se dibuja sólida, para hacerla punteada se requiere un pathDash,
    // pero para empezar sólida está bien visualmente).
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
