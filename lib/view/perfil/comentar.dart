import 'package:flutter/material.dart';
import 'package:ecoaventura_app/theme/tema.dart';

class ComentarPage extends StatefulWidget {
  const ComentarPage({super.key});

  @override
  State<ComentarPage> createState() => _ComentarPageState();
}

class _ComentarPageState extends State<ComentarPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _comentarioController = TextEditingController();

  void _enviarComentario() {
    if (_formKey.currentState!.validate()) {
      // Aquí puedes enviar el comentario a tu backend o guardarlo localmente
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Comentario enviado correctamente")),
      );

      // Limpiar el campo después de enviar
      _comentarioController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comentar"),
        backgroundColor: MiTema.verdeSecundario,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Regresa a PerfilPage
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Deja tu comentario o reseña:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // Campo para comentario
              TextFormField(
                controller: _comentarioController,
                keyboardType: TextInputType.multiline,
                maxLines: 6,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Escribe algo antes de enviar";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Escribe tu comentario aquí...",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Botón enviar
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: MiTema.verdePrincipal),
                onPressed: _enviarComentario,
                child: const Text(
                  "Enviar comentario",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
