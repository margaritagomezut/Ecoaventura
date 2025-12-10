import 'package:flutter/material.dart';
import 'package:ecoaventura_app/theme/tema.dart';

class ConfiguracionPage extends StatefulWidget {
  const ConfiguracionPage({super.key});

  @override
  State<ConfiguracionPage> createState() => _ConfiguracionPageState();
}

class _ConfiguracionPageState extends State<ConfiguracionPage> {
  bool _notificaciones = true;
  bool _modoOscuro = false;
  bool _ubicacion = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configuración"),
        backgroundColor: MiTema.verdeSecundario,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Regresa a PerfilPage
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Ajustes de la aplicación",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Notificaciones
          SwitchListTile(
            title: const Text("Notificaciones"),
            value: _notificaciones,
            onChanged: (bool value) {
              setState(() {
                _notificaciones = value;
              });
            },
            activeColor: MiTema.verdePrincipal,
          ),

          // Modo oscuro
          SwitchListTile(
            title: const Text("Modo oscuro"),
            value: _modoOscuro,
            onChanged: (bool value) {
              setState(() {
                _modoOscuro = value;
              });
            },
            activeColor: MiTema.verdePrincipal,
          ),

          // Compartir ubicación
          SwitchListTile(
            title: const Text("Compartir ubicación"),
            value: _ubicacion,
            onChanged: (bool value) {
              setState(() {
                _ubicacion = value;
              });
            },
            activeColor: MiTema.verdePrincipal,
          ),

          const Divider(height: 40),

          // Botón restablecer ajustes
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: MiTema.verdePrincipal),
            onPressed: () {
              setState(() {
                _notificaciones = true;
                _modoOscuro = false;
                _ubicacion = true;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Ajustes restablecidos")),
              );
            },
            child: const Text(
              "Restablecer ajustes",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

