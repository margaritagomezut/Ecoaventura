import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ecoaventura_app/theme/tema.dart';
import 'package:image_picker/image_picker.dart';

class EditarPerfilPage extends StatefulWidget {
  const EditarPerfilPage({super.key});

  @override
  State<EditarPerfilPage> createState() => _EditarPerfilPageState();
}

class _EditarPerfilPageState extends State<EditarPerfilPage> {
  final _formKey = GlobalKey<FormState>();

  // Controladores con datos de ejemplo
  final TextEditingController _nombreController =
      TextEditingController(text: "Usuario Ejemplo");
  final TextEditingController _emailController =
      TextEditingController(text: "usuario@ecoaventura.com");
  final TextEditingController _telefonoController =
      TextEditingController(text: "999 123 4567");

  File? _imagenPerfil;
  final ImagePicker _picker = ImagePicker();

  // Cambiar imagen desde galería
  Future<void> _cambiarImagen() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imagenPerfil = File(pickedFile.path);
      });
    }
  }

  // Guardar cambios y regresar a PerfilPage
  void _guardarCambios() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Datos guardados correctamente")),
      );

      // Regresa a PerfilPage
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Perfil"),
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
            children: [
              // Imagen de perfil
              GestureDetector(
                onTap: _cambiarImagen,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _imagenPerfil != null
                      ? FileImage(_imagenPerfil!)
                      : const AssetImage("assets/img/perfil_default.png") as ImageProvider,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: MiTema.verdeSecundario,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(4),
                      child: const Icon(Icons.edit, size: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Campos de edición
              _buildTextField(controller: _nombreController, label: "Nombre"),
              const SizedBox(height: 12),
              _buildTextField(
                  controller: _emailController,
                  label: "Correo Electrónico",
                  tipo: TextInputType.emailAddress),
              const SizedBox(height: 12),
              _buildTextField(
                  controller: _telefonoController,
                  label: "Teléfono",
                  tipo: TextInputType.phone),
              const SizedBox(height: 20),

              // Botón guardar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: MiTema.verdePrincipal),
                  onPressed: _guardarCambios,
                  child: const Text("Guardar cambios", style: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para los campos de texto
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType tipo = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: tipo,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Este campo es obligatorio";
        }
        if (label == "Correo Electrónico" &&
            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return "Correo inválido";
        }
        if (label == "Teléfono" &&
            !RegExp(r'^\d{7,15}$').hasMatch(value.replaceAll(' ', ''))) {
          return "Teléfono inválido";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
