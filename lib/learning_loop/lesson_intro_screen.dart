import 'package:flutter/material.dart';
import 'package:educational/utils/colors.dart';

class LessonIntroScreen extends StatelessWidget {
  const LessonIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          kPrimaryGreen, // Fondo verde oscuro para la parte superior
      appBar: AppBar(
        title: const Text("Lección", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          // --- SECCIÓN SUPERIOR: TEORÍA (40% de la pantalla) ---
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sistemas: Redes en Inglés",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Tarjeta blanca con el diagrama/texto
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: Text(
                          "[Aquí va el diagrama de redes]\n\n• Server\n• Client\n• Protocol",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey[800]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // --- SECCIÓN INFERIOR: CHAT (60% de la pantalla) ---
          Expanded(
            flex: 6,
            child: Container(
              decoration: const BoxDecoration(
                color: kCream, // Fondo claro para el chat
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Mensaje del Colibrí
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: kPistache,
                          child: Icon(
                            Icons.flutter_dash,
                            color: kPrimaryGreen,
                          ), // Placeholder colibrí
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: const Text(
                              "¡Hola! Practiquemos una entrevista de soporte IT.",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // Opciones de respuesta (Botones burbuja)
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.end,
                    children: [
                      _buildChatOption("Prestigeome one recos?"),
                      _buildChatOption("Una entrevista de soporte IT!"),
                      _buildChatOption("Correct-me amiose IT"),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Input de texto
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Escribe un mensaje...",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: Icon(Icons.send, color: kPrimaryGreen),
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

  Widget _buildChatOption(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: ActionChip(
        label: Text(text),
        backgroundColor: kPistache,
        labelStyle: TextStyle(color: Colors.brown[900]),
        shape: const StadiumBorder(),
        onPressed: () {},
      ),
    );
  }
}
