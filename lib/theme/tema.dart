import 'package:flutter/material.dart';

class MiTema {
  // PALETA DE COLORES PRINCIPAL DE ECOAVENTURA
  static const Color verdePrincipal = Color(0xFF14C3A2); // #14C3A2
  static const Color verdeSecundario = Color(0xFF20B2AA); // #20B2AA
  static const Color azulClaro = Color(0xFFF0F8FF);       // #F0F8FF
  static const Color grisOscuro = Color(0xFF595B5A);      // #595B5A
  static const Color verdeMedio = Color(0xFF3CB371);      // #3CB371
  static const Color beige = Color(0xFFF5F5DC);

  static Color? get verdeClaro => null;           // #F5F5DC

  // FUNCIÓN QUE DEVUELVE EL TEMA GLOBAL DE LA APP
  static ThemeData temaApp(BuildContext context) {
    return ThemeData(
      primaryColor: verdePrincipal,               // Color principal de la app
      scaffoldBackgroundColor: azulClaro,        // Fondo de la app
      appBarTheme: _temaAppBar(),                // Tema de AppBar
      bottomNavigationBarTheme: _temaBottomNav(),// Tema del BottomNavigationBar
      snackBarTheme: _temaSnack(),               // Tema de SnackBar
      colorScheme: _esquemaColores(context),     // Esquema de colores general
    );
  }

  // ESQUEMA DE COLORES DE LA APP
  static ColorScheme _esquemaColores(BuildContext context) {
    return ColorScheme(
      brightness: MediaQuery.platformBrightnessOf(context), // Detecta modo claro/oscuro
      primary: verdePrincipal,       // Color principal
      onPrimary: azulClaro,          // Color para texto sobre primary
      secondary: verdeMedio,         // Color secundario
      onSecondary: beige,            // Texto sobre secondary
      error: Colors.red,             // Color para errores
      onError: Colors.white,         // Texto sobre errores
      background: azulClaro,         // Fondo general
      onBackground: grisOscuro,      // Texto sobre fondo
      surface: beige,                // Color de superficies (cards, modales)
      onSurface: grisOscuro,         // Texto sobre superficies
    );
  }

  // TEMA DEL APPBAR
  static AppBarTheme _temaAppBar() {
    return AppBarTheme(
      backgroundColor: verdePrincipal, // Fondo del AppBar
      foregroundColor: azulClaro,      // Color del texto e iconos
      elevation: 3,                     // Sombra
    );
  }

  // TEMA DEL BOTTOM NAVIGATION BAR
  static BottomNavigationBarThemeData _temaBottomNav() {
    return BottomNavigationBarThemeData(
      selectedItemColor: verdePrincipal, // Color del tab seleccionado
      unselectedItemColor: grisOscuro,   // Color de tabs no seleccionados
      backgroundColor: beige,             // Fondo del BottomNavigationBar
    );
  }

  // TEMA DEL SNACKBAR
  static SnackBarThemeData _temaSnack() {
    return SnackBarThemeData(
      backgroundColor: grisOscuro,       // Fondo del snackbar
      contentTextStyle: const TextStyle( // Texto del snackbar
        color: azulClaro,
        fontSize: 18,
      ),
      behavior: SnackBarBehavior.floating, // Snackbar flotante
    );
  }
}

