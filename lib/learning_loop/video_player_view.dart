import 'package:flutter/material.dart';
import 'package:educational/utils/colors.dart';
// Para el reproductor real, necesitarías un paquete como video_player o youtube_player_flutter.
// Aquí usamos un Widget Placeholder (Container azul) para simular la vista.

class VideoPlayerView extends StatelessWidget {
  final String moduleTitle; // Para saber qué contenido estamos viendo

  const VideoPlayerView({
    super.key,
    this.moduleTitle = 'Conceptos Clave de Redes', // Valor por defecto
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCream,
      body: Column(
        children: [
          // 1. REPRODUCTOR DE VIDEO (Placeholder)
          Container(
            height: 220, // Altura estándar para el reproductor
            width: double.infinity,
            color: Colors.blueGrey[900], // Fondo oscuro para simular el video
            alignment: Alignment.center,
            child: const Text(
              '[Video Player Widget aquí]',
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
          ),

          // 2. CONTENIDO Y PUNTOS CLAVE (Lista de Lecciones)
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    moduleTitle,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[900],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Video Introductorio | 5:30 min",
                    style: TextStyle(fontSize: 16, color: kPrimaryGreen),
                  ),
                  const SizedBox(height: 25),

                  const Text(
                    "Puntos Clave del Video:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  // Lista de Puntos Clave
                  ..._buildKeyPoints(), // Lista de widgets generada

                  const SizedBox(height: 30),

                  // BOTÓN DE ACCIÓN (Navegar a la Etapa 4: Chatbot)
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/chatbot_interface');
                      // NAVEGACIÓN FUTURA
                    },
                    icon: const Icon(Icons.forum_rounded, size: 28),
                    label: const Text('Comenzar Práctica con Chatbot'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryGreen,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget Helper para los puntos clave (simula una lista de lecciones)
  List<Widget> _buildKeyPoints() {
    final points = [
      {'title': 'Introducción a la Topología', 'completed': true},
      {'title': 'Definición de Protocolos', 'completed': false},
      {'title': 'TCP/IP vs. OSI Model', 'completed': false},
    ];

    return points.map((point) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Row(
          children: [
            Icon(
              point['completed'] as bool
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
              color: point['completed'] as bool ? kAccentGreen : Colors.grey,
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                point['title'] as String,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: point['completed'] as bool
                      ? FontWeight.w600
                      : FontWeight.normal,
                  color: Colors.brown[800],
                ),
              ),
            ),
            // Aquí irían los Time Stamps o indicadores de progreso
            const Text('0:00', style: TextStyle(color: Colors.grey)),
          ],
        ),
      );
    }).toList();
  }
}
