import 'package:flutter/material.dart';
import 'package:educational/utils/colors.dart';

// Definición de un modelo simple para la pregunta (opcional, pero buena práctica)
class QuizQuestion {
  final String questionText;
  final List<String> options;
  final String correctAnswer;
  final String questionType; // Ej: 'multiple_choice', 'drag_drop', 'audio'

  QuizQuestion({
    required this.questionText,
    required this.options,
    required this.correctAnswer,
    this.questionType = 'multiple_choice',
  });
}

class ExerciseEngineScreen extends StatefulWidget {
  const ExerciseEngineScreen({super.key});

  @override
  State<ExerciseEngineScreen> createState() => _ExerciseEngineScreenState();
}

class _ExerciseEngineScreenState extends State<ExerciseEngineScreen> {
  final List<QuizQuestion> _questions = [
    QuizQuestion(
      questionText:
          "¿Cuál es el protocolo que se utiliza para la navegación web segura?",
      options: ['FTP', 'SMTP', 'HTTPS', 'UDP'],
      correctAnswer: 'HTTPS',
    ),
    QuizQuestion(
      questionText:
          "¿Qué término usarías para describir el cableado físico que conecta los dispositivos?",
      options: ['Topology', 'Hardware', 'Media', 'Packet'],
      correctAnswer: 'Media',
    ),
  ];

  int _currentQuestionIndex = 0;
  String? _selectedAnswer;

  void _selectAnswer(String answer) {
    setState(() {
      _selectedAnswer = answer;
    });
  }

  void _nextQuestion() {
    // Lógica de validación (opcional, para feedback inmediato)
    if (_selectedAnswer != null) {
      if (_selectedAnswer == _questions[_currentQuestionIndex].correctAnswer) {
        // Respuesta Correcta
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('¡Respuesta Correcta!'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        // Respuesta Incorrecta
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Incorrecto. Intenta de nuevo.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }

    // Avanzar a la siguiente pregunta
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedAnswer = null;
      });
    } else {
      // Fin del Quiz: Navegar al resumen
      _showQuizSummary();
    }
  }

  void _showQuizSummary() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¡Módulo Completado! 🌟'),
        content: const Text(
          'Has terminado la práctica del módulo. Puedes regresar al mapa o revisar tu Glosario.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Navegar al Dashboard y eliminar la navegación de quiz
              // Aseguramos que el contexto siga montado (aunque el showDialog lo maneja bien)
              if (!context.mounted) return;
              Navigator.popUntil(context, ModalRoute.withName('/dashboard'));
            },
            child: const Text('Volver al Mapa'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestionIndex];
    final progress = (_currentQuestionIndex + 1) / _questions.length;

    return Scaffold(
      backgroundColor: kCream,
      appBar: AppBar(
        title: Text(
          "Quiz de Validación ${_currentQuestionIndex + 1}/${_questions.length}",
          style: TextStyle(color: Colors.brown[900]),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.brown[900]),
        actions: [
          TextButton(
            onPressed: _showQuizSummary,
            child: Text(
              "Finalizar",
              style: TextStyle(
                color: kPrimaryGreen,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Indicador de Progreso
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              color: kPrimaryGreen,
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
            const SizedBox(height: 25),

            // Contenedor de la Pregunta (Simula una tarjeta grande)
            Expanded(
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Pregunta de Opción Múltiple:",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        currentQuestion.questionText,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[900],
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Opciones de Respuesta
                      // --- CORRECCIÓN APLICADA AQUÍ ---
                      ...currentQuestion.options.map(
                        (option) => _buildOptionTile(option),
                      ),
                      // --------------------------------
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Botón de Continuar
            ElevatedButton(
              onPressed: _selectedAnswer != null ? _nextQuestion : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryGreen,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                _currentQuestionIndex < _questions.length - 1
                    ? 'CONTINUAR'
                    : 'VER RESULTADOS',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionTile(String option) {
    final bool isSelected = _selectedAnswer == option;
    // La comprobación de corrección solo se usa para el feedback visual después de la respuesta
    final bool isCorrect =
        isSelected && option == _questions[_currentQuestionIndex].correctAnswer;

    Color borderColor = Colors.grey.shade300;
    Color tileColor = Colors.white;

    if (isSelected) {
      borderColor = isCorrect ? Colors.green : Colors.red;
      tileColor = isCorrect ? kPistache : kOffWhite;
    }

    return GestureDetector(
      onTap: () => _selectAnswer(option),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: tileColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              offset: const Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: isSelected
                  ? (isCorrect ? Colors.green : Colors.red)
                  : Colors.grey,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                option,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.brown[800],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
