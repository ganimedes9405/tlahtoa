import 'package:flutter/material.dart';
import 'package:educational/utils/colors.dart';

class GlossaryView extends StatelessWidget {
  const GlossaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCream,
      appBar: AppBar(
        title: const Text(
          "Glosario / Mochila",
          style: TextStyle(color: Colors.brown),
        ),
        backgroundColor: kCream,
        elevation: 0,
      ),
      body: const Center(
        child: Text(
          'Aquí se mostrarán las palabras y conceptos guardados.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.brown),
        ),
      ),
    );
  }
}
