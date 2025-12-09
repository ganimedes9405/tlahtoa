import 'package:flutter/material.dart';
import 'package:educational/utils/colors.dart';
import 'package:educational/widgets/cards/selection_card.dart';

class SpecializationSelectScreen extends StatefulWidget {
  const SpecializationSelectScreen({super.key});

  @override
  State<SpecializationSelectScreen> createState() =>
      _SpecializationSelectScreenState();
}

class _SpecializationSelectScreenState
    extends State<SpecializationSelectScreen> {
  int _selectedIndex = -1;

  final List<Map<String, dynamic>> _areas = [
    {'title': 'Cosmetology', 'icon': Icons.brush},
    {'title': 'Industrial engineering', 'icon': Icons.memory},
    {'title': 'Artificial intelligence', 'icon': Icons.music_note},
    {'title': 'Gastronomy', 'icon': Icons.map},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCream,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                "¿Cuál es tu área?",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[900],
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: _areas.length,
                  itemBuilder: (context, index) {
                    return SelectionCard(
                      title: _areas[index]['title'],
                      icon: _areas[index]['icon'],
                      isSelected: _selectedIndex == index,
                      onTap: () async {
                        // <-- Nota el 'async' aquí
                        setState(() => _selectedIndex = index);

                        // Esperamos 300ms
                        await Future.delayed(const Duration(milliseconds: 300));

                        // Verificación moderna: Si el contexto ya no es válido, detenemos la ejecución.
                        if (!context.mounted) return;

                        // Si llegamos aquí, es seguro navegar
                        Navigator.pushNamed(context, '/language_select');
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
