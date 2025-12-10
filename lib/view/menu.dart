import 'package:flutter/material.dart';
import '../theme/tema.dart' show MiTema;

/// Drawer (menú lateral) de la aplicación EcoAventura
Drawer menu(BuildContext context) {
  return Drawer(
    backgroundColor: MiTema.azulClaro, // Fondo del Drawer con color principal
    child: Column(
      children: [
        _encabezado(context), // Encabezado moderno con avatar
        const SizedBox(height: 10),
        // Opciones del menú lateral (secundarias)


        _opcion(context, Icons.map, 'Rutas/Tours', () {
          _mensaje(context, 'Rutas/Tours');
        }),

        _opcion(context, Icons.event, 'Eventos/Actividades', () {
          _mensaje(context, 'Eventos/Actividades');
        }),

        _opcion(context, Icons.help_outline, 'Ayuda', () {
          _mensaje(context, 'Ayuda');
        }),
      ],
    ),
  );
}

/// Encabezado del Drawer moderno con avatar centrado
Widget _encabezado(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 30),
    width: double.infinity,
    color: MiTema.verdeSecundario.withOpacity(0.2), // Fondo suave y transparente
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Icono redondo de usuario
        Image.asset(  
          'assets/img/logo.png',
          width: 150,
          height: 100,
        ),
        const SizedBox(height: 5),
        Text(
          'ECOAVENTURA', // Nombre dinámico más adelante
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        Text(
          'ecoaventura_app', // Email o usuario secundario
          style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
        ),
      ],
    ),
  );
}

/// Opción individual del menú lateral
/// icono: Icono que se mostrará
/// texto: Texto de la opción
/// accion: Función que se ejecuta al pulsar la opción
Widget _opcion(
    BuildContext context, IconData icono, String texto, Function() accion) {
  return ListTile(
    leading: Icon(icono, color: const Color.fromARGB(255, 0, 0, 0)), // Icono del item
    title: Text(texto, style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))), // Texto
    onTap: () {
      Navigator.pop(context); // Cierra el drawer
      accion(); // Ejecuta la acción asignada
    },
  );
}

/// Muestra un mensaje temporal (SnackBar) en la pantalla
void _mensaje(BuildContext context, String txt) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(txt),
      backgroundColor: MiTema.grisOscuro, // Fondo del SnackBar
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
    ),
  );
}





