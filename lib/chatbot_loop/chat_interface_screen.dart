import 'package:flutter/material.dart';
import 'package:educational/utils/colors.dart';

class ChatInterfaceScreen extends StatefulWidget {
  final String moduleTitle;

  const ChatInterfaceScreen({
    super.key,
    this.moduleTitle =
        'Conceptos Clave de Redes', // Asumimos un módulo por defecto
  });

  @override
  State<ChatInterfaceScreen> createState() => _ChatInterfaceScreenState();
}

class _ChatInterfaceScreenState extends State<ChatInterfaceScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {
      'text':
          '🤖 ¡Bienvenido! Soy Huitzilin (Colibrí). Practiquemos una entrevista sobre tu módulo: Conceptos Clave.',
      'isUser': false,
    },
    {'text': 'Tú serás un candidato junior. ¿Estás listo?', 'isUser': false},
    {'text': '¡Estoy listo!', 'isUser': true},
  ];

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    final userMessage = _controller.text;

    setState(() {
      _messages.add({'text': userMessage, 'isUser': true});
      _controller.clear();
      // Simulación de respuesta del bot
      _messages.add({
        'text':
            'Muy bien. Por favor, define "Protocolo" en inglés técnico. ¡Recuerda usar la terminología que viste en el video!',
        'isUser': false,
      });
    });
    // Aquí iría la lógica para enviar a la API del Chatbot
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.moduleTitle,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: kPrimaryGreen, // AppBar verde para el top Contexto
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.star_border),
            onPressed: () {
              // NAVEGACIÓN FUTURA: Conexión a la Etapa 5 (Quiz)
              Navigator.pushNamed(context, '/quiz_engine_screen');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 1. SECCIÓN DE CONTEXTO/TEORÍA
          Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            color: kPrimaryGreen,
            child: const Text(
              'Contexto: Entrevista de Soporte IT. Tu objetivo es explicar los conceptos básicos de networking.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),

          // 2. SECCIÓN DE CHAT INTERACTIVO
          Expanded(
            child: Container(
              color: kCream, // Fondo estilo pergamino para el chat
              child: ListView.builder(
                reverse: true, // Para que el scroll inicie abajo
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[_messages.length - 1 - index];
                  return ChatBubble(
                    text: message['text'] as String,
                    isUser: message['isUser'] as bool,
                  );
                },
              ),
            ),
          ),

          // 3. CAMPO DE ENTRADA DE TEXTO
          _buildChatInput(),
        ],
      ),
    );
  }

  // Widget para el campo de entrada
  Widget _buildChatInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Escribe tu respuesta aquí...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: kOffWhite,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
              ),
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          const SizedBox(width: 8.0),
          Container(
            decoration: BoxDecoration(
              color: kPrimaryGreen,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.send),
              color: Colors.white,
              onPressed: _sendMessage,
            ),
          ),
        ],
      ),
    );
  }
}

// -------------------------------------------------------------------
// WIDGET HELPER: Burbuja de Chat (ChatBubble)
// -------------------------------------------------------------------
class ChatBubble extends StatelessWidget {
  final String text;
  final bool isUser;

  const ChatBubble({super.key, required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isUser
              ? kPrimaryGreen
              : Colors.white, // Usuario: Verde, Bot: Blanco
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(
              isUser ? 16 : 4,
            ), // Cola corta en la esquina
            bottomRight: Radius.circular(isUser ? 4 : 16),
          ),
          boxShadow: [
            BoxShadow(
              // CORRECCIÓN APLICADA AQUÍ: Reemplazo de withOpacity por withValues
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isUser ? Colors.white : Colors.brown[900],
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
