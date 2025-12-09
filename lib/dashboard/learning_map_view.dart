import 'package:flutter/material.dart';
import 'package:educational/utils/colors.dart';

// -------------------------------------------------------------------
// CLASE PRINCIPAL DEL MAPA (LEARNING MAP VIEW)
// -------------------------------------------------------------------
class LearningMapView extends StatelessWidget {
  const LearningMapView({super.key});

  @override
  Widget build(BuildContext context) {
    // Nota: El AppBar se simplifica, ya que la Navbar del MainContainerScreen
    // proveerá la navegación principal y el botón del Colibrí.
    return Scaffold(
      backgroundColor: kCream,
      appBar: AppBar(
        title: const Text(
          "Tu Camino Profesional",
          style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        // Eliminamos el 'leading' forzado, ya que este View está dentro del Shell.
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // CAPA 1: EL CAMINO PUNTEADO
              CustomPaint(
                size: const Size(double.infinity, 600),
                painter: RoadMapPainter(),
              ),

              // CAPA 2: LOS NIVELES (Botones circulares)
              Column(
                children: [
                  // IMPORTANTE: PASAR EL CONTEXTO
                  _buildLevelNode(context, "Conceptos\nClave", true, 0),
                  const SizedBox(height: 80),
                  _buildLevelNode(
                    context,
                    "Vocabulario\nTécnico",
                    false,
                    1,
                    isLeft: false,
                  ),
                  const SizedBox(height: 80),
                  _buildLevelNode(context, "Prefijos\nRaíces", false, 2),
                  const SizedBox(height: 80),
                  _buildLevelNode(
                    context,
                    "Examen\nFinal",
                    false,
                    3,
                    isLeft: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper para crear los círculos de los niveles (REPARADO: RECIBE CONTEXTO)
  Widget _buildLevelNode(
    BuildContext context, // <-- Contexto agregado
    String title,
    bool isUnlocked,
    int index, {
    bool isLeft = true,
  }) {
    final double horizontalOffset = isLeft ? -60.0 : 60.0;

    // Si el nivel está desbloqueado, asignamos la función onTap
    final VoidCallback? onTap = isUnlocked
        ? () =>
              _showLessonDetailsModal(context, title) // <-- Llama al modal
        : null;

    return Transform.translate(
      offset: Offset(horizontalOffset, 0),
      child: GestureDetector(
        // <-- RESTAURADO: HACE EL NODO PULSABLE
        onTap: onTap,
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
                    offset: const Offset(0, 4),
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
      ),
    );
  }
}

// -------------------------------------------------------------------
// FUNCIÓN MODAL (showModalBottomSheet) - RESTAURADA
// -------------------------------------------------------------------
void _showLessonDetailsModal(BuildContext context, String moduleTitle) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          color: kOffWhite,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Módulo Seleccionado: $moduleTitle',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[900],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Aprende las 3 lecciones sobre $moduleTitle para avanzar.',
                style: TextStyle(fontSize: 16, color: Colors.brown[600]),
              ),
              const Spacer(),

              // BOTÓN 1: Video Player (Etapa 3) - NAVEGACIÓN REAL
              ElevatedButton.icon(
                onPressed: () {
                  if (!context.mounted) return;
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    '/video_player_view',
                  ); // <-- NAVEGACIÓN REAL
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryGreen,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.play_circle, size: 28),
                label: const Text('Ver Video Introductorio'),
              ),
              const SizedBox(height: 15),

              // BOTÓN 2: Salto a la Práctica (Chatbot - Etapa 4) - NAVEGACIÓN REAL
              OutlinedButton(
                onPressed: () {
                  if (!context.mounted) return;
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    '/chatbot_interface',
                  ); // <-- NAVEGACIÓN REAL
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: kPrimaryGreen,
                  side: const BorderSide(color: kPrimaryGreen, width: 2),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Saltar a la Práctica (Chat)'),
              ),
            ],
          ),
        ),
      );
    },
  );
}

// -------------------------------------------------------------------
// ROAD MAP PAINTER (Se mantiene sin cambios)
// -------------------------------------------------------------------
class RoadMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.brown.withValues(alpha: 0.3)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round; // Puntos redondos

    final path = Path();
    path.moveTo(size.width * 0.5 - 60, 40);
    path.quadraticBezierTo(size.width * 0.2, 120, size.width * 0.5 + 60, 160);
    path.quadraticBezierTo(size.width * 0.8, 260, size.width * 0.5 - 60, 300);
    path.quadraticBezierTo(size.width * 0.2, 400, size.width * 0.5 + 60, 440);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
