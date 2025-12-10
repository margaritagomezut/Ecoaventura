import 'package:flutter/material.dart';
import 'package:ecoaventura_app/theme/tema.dart';

class TerminosPage extends StatelessWidget {
  const TerminosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Términos y Condiciones"),
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
        child: const Text(
          "Aquí van los términos y condiciones del uso de la app Ecoaventura. "
          "Asegúrate de leerlos cuidadosamente antes de utilizar la aplicación. "
          "El uso de la app implica la aceptación de estos términos y condiciones, "
          "así como de las políticas de privacidad y manejo de datos personales.",
          style: TextStyle(fontSize: 16, height: 1.5),
        ),
      ),
    );
  }
}

