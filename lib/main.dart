import 'package:flutter/material.dart';
import 'theme/tema.dart';
import 'view/inicio.dart';
import 'package:url_launcher/link.dart';

// Importaciones de vistas de lugares turísticos
import 'package:ecoaventura_app/view/lugares/turisticos/tonina.dart';
import 'package:ecoaventura_app/view/lugares/turisticos/ayutla.dart';
import 'package:ecoaventura_app/view/lugares/turisticos/laventana.dart';
import 'package:ecoaventura_app/view/lugares/turisticos/lalibertad.dart';
// Importaciones de vistas de lugares ecoturísticos
import 'package:ecoaventura_app/view/lugares/ecoturisticos/naha.dart';
import 'package:ecoaventura_app/view/lugares/ecoturisticos/metzabook.dart';
import 'package:ecoaventura_app/view/lugares/ecoturisticos/lagunamiramar.dart';
import 'package:ecoaventura_app/view/lugares/ecoturisticos/sejkajub.dart';
import 'package:ecoaventura_app/view/lugares/ecoturisticos/lacanjatzeltal.dart';
import 'package:ecoaventura_app/view/lugares/ecoturisticos/xanil.dart';
import 'package:ecoaventura_app/view/lugares/ecoturisticos/sietecolores.dart';
// Importaciones de vistas de balnearios
import 'package:ecoaventura_app/view/lugares/balnearios/tiodimas.dart';
import 'package:ecoaventura_app/view/lugares/balnearios/elencanto.dart';
import 'package:ecoaventura_app/view/lugares/balnearios/latecnica.dart';
import 'package:ecoaventura_app/view/lugares/balnearios/losreyes.dart';
import 'package:ecoaventura_app/view/lugares/balnearios/ranchomirador.dart';
import 'package:ecoaventura_app/view/lugares/balnearios/riojatate.dart';
// Importaciones de vistas de Hoteles

// Importaciones de vistas de Restaurantes
// Importaciones de vistas de Transportes
// Importaciones de vistas de perfil y configuración
import 'package:ecoaventura_app/view/perfil/editar_perfil.dart';
import 'package:ecoaventura_app/view/perfil/comentar.dart';
import 'package:ecoaventura_app/view/perfil/terminos.dart';
import 'package:ecoaventura_app/view/perfil/configuración.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta el banner de debug
      title: 'Ecoaventura',
      theme: MiTema.temaApp(context), // Aplica el tema global definido
      initialRoute: '/login', // Ruta inicial: login
      routes: {
        '/login': (context) => const LoginPage(title: 'Ecoaventura'),
        '/inicio': (context) => const VistaInicio(title: 'Inicio - Ecoaventura'),
        // Rutas para lugares turísticos
        '/lugares/turisticos/tonina': (context) => const Tonina(),
        '/lugares/turisticos/ayutla': (context) => const PlanAyutla(),
        '/lugares/turisticos/laventana': (context) => const LaVentana(),
        '/lugares/turisticos/lalibertad': (context) => const LaLibertad(),
        // Rutas para lugares ecoturísticos
        '/lugares/ecoturisticos/naha': (context) => const Naha(),
        '/lugares/ecoturisticos/metzabook': (context) => const Metzabook(),
        '/lugares/ecoturisticos/miramar': (context) => const LagunaMiramar(),
        '/lugares/ecoturisticos/sej-kajub': (context) => const SejKajub(),
        '/lugares/ecoturisticos/lacanja': (context) => const LacanjaTzeltal(),
        '/lugares/ecoturisticos/xanil': (context) => const Xanil(),
        '/lugares/ecoturisticos/siete-colores': (context) => const SieteColores(),
        // Rutas para balnearios
        '/lugares/balnearios/dimas': (context) => const TioDimas(),
        '/lugares/balnearios/encanto': (context) => const ElEncanto(),
        '/lugares/balnearios/tecnica': (context) => const LaTecnica(),
        '/lugares/balnearios/reyes': (context) => const LosReyes(),
        'lugares/balnearios/rancho': (context) => const RanchoMirador(),
        '/lugares/balnearios/jatate': (context) => const RioJatate(),
        // Rutas para perfil y configuración
        '/editarPerfil': (context) => const EditarPerfilPage(),
        '/comentar': (context) => const ComentarPage(),
        '/terminos': (context) => const TerminosPage(),
        '/configuracion': (context) => const ConfiguracionPage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _ctrlEmail = TextEditingController();
  final TextEditingController _ctrlPwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/ecoturisticos/miramar-1.png'), // Ruta de tu imagen
            fit: BoxFit.cover, // Asegura que la imagen cubra todo el fondo
            opacity: 0.5, // Puedes ajustar la opacidad si es necesario
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7), // Fondo blanco semi-transparente
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    spreadRadius: 4,
                  ),
                ], // Sombra sutil para dar profundidad
              ),
              child: _columna(), // Estructura principal del login
            ),
          ),
        ),
      ),
    );
  }

  Widget _columna() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _logo(),
        const SizedBox(height: 20),
        _txtEmail(),
        const SizedBox(height: 15),
        _txtPassword(),
        const SizedBox(height: 30),
        _boton(),
        _avisoPrivacidad(),
      ],
    );
  }

  Widget _logo() {
    return Column(
      children: [
        Image.asset('assets/img/logo.png', width: 200),
        const SizedBox(height: 10),
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [
              Color(0xFF004A75), // Azul oscuro
              Color(0xFF0081A7), // Azul más brillante
            ],
            stops: [0.7, 1.0],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: const Text(
            'Ecoaventura',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white, // El color no importa porque es el degradado el que se aplica
            ),
          ),
        ),
      ],
    );
  }

  Widget _txtEmail() {
    return TextField(
      controller: _ctrlEmail,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email, color: Colors.black),
        labelText: "Correo",
        labelStyle: const TextStyle(color: Colors.black),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.5),
          borderRadius: BorderRadius.circular(15),
        ),
        fillColor: Colors.white, // Blanco para los campos de entrada
        filled: true,
      ),
      style: const TextStyle(color: Colors.black),
    );
  }

  Widget _txtPassword() {
    return TextField(
      controller: _ctrlPwd,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock, color: Colors.black),
        labelText: "Contraseña",
        labelStyle: const TextStyle(color: Colors.black),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.5),
          borderRadius: BorderRadius.circular(15),
        ),
        fillColor: Colors.white, // Blanco para los campos de entrada
        filled: true,
      ),
      style: const TextStyle(color: Colors.black),
    );
  }

  Widget _boton() {
    return ElevatedButton.icon(
      onPressed: _ingresar,
      icon: const Icon(Icons.login),
      label: const Text("Ingresar", style: TextStyle(fontSize: 20)),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF4CAF50), // Verde brillante
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  void _ingresar() {
    String mensaje;
    if (_ctrlEmail.text == 'admin' && _ctrlPwd.text == '4dm1n') {
      mensaje = 'Bienvenido a Ecoaventura';
      Navigator.pushReplacementNamed(context, '/inicio');
    } else {
      mensaje = 'Usuario y/o contraseña incorrecta';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        backgroundColor: Colors.black,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Widget _avisoPrivacidad() {
    return Link(
      uri: Uri(scheme: "https", host: "google.com"),
      builder: (context, FollowLink) {
        return TextButton(
          onPressed: FollowLink,
          child: Text(
            "Aviso de privacidad",
            style: TextStyle(
              color: Colors.green, // Verde brillante
              fontSize: 16,
              decoration: TextDecoration.underline,
            ),
          ),
        );
      },
    );
  }
}
