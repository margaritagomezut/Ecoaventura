import 'package:ecoaventura_app/theme/tema.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Paleta combinada con tu pantalla de inicio
    const Color fondo = Color(0xFF02140C);        // verde muy oscuro
    const Color card = Color(0xFF06261A);         // verde oscuro ligeramente más claro
    const Color textoPrincipal = Colors.white;
    const Color textoSecundario = Color(0xFFBFC3CF);

    return Scaffold(
      backgroundColor: fondo,
      appBar: AppBar(
        backgroundColor: fondo,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Perfil',
          style: TextStyle(
            color: textoPrincipal,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: textoPrincipal),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No hay notificaciones')),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          // ------- BLOQUE "INICIAR SESIÓN O REGISTRARSE" -------
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: card,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.white.withOpacity(0.06),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Accede a EcoAventura desde cualquier dispositivo',
                    style: TextStyle(
                      color: textoPrincipal,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Regístrate, guarda tus lugares favoritos y '
                    'reserva actividades de forma más rápida.',
                    style: TextStyle(
                      color: textoSecundario,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MiTema.verdePrincipal,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text(
                        'Iniciar sesión o registrarse',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ------- SECCIÓN CUENTA -------
          _sectionTitle('Cuenta'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: card,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.white.withOpacity(0.06),
                ),
              ),
              child: _buildHeader(),
            ),
          ),
          const SizedBox(height: 12),

          _itemTile(
            icon: Icons.edit,
            text: 'Editar perfil',
            subtitle: 'Nombre, correo y foto',
            onTap: () => Navigator.pushNamed(context, '/editarPerfil'),
          ),
          _itemTile(
            icon: Icons.comment_rounded,
            text: 'Comentar',
            subtitle: 'Comparte tu opinión sobre la app',
            onTap: () => Navigator.pushNamed(context, '/comentar'),
          ),

          // ------- SECCIÓN CONFIGURACIÓN -------
          _sectionTitle('Configuración'),
          _itemTile(
            icon: Icons.settings,
            text: 'Configuración',
            subtitle: 'Preferencias de la aplicación',
            onTap: () => Navigator.pushNamed(context, '/configuracion'),
          ),

          // ------- SECCIÓN LEGAL -------
          _sectionTitle('Información legal'),
          _itemTile(
            icon: Icons.article,
            text: 'Términos y condiciones',
            subtitle: 'Lee los términos de uso',
            onTap: () => Navigator.pushNamed(context, '/terminos'),
          ),

          const SizedBox(height: 16),

          // ------- CERRAR SESIÓN (ROJO) -------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: card,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.red.withOpacity(0.25),
                ),
              ),
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text(
                  'Cerrar sesión',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(Icons.chevron_right, color: Colors.red),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: const Color(0xFF0E1812),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: const Text(
                        'Cerrar sesión',
                        style: TextStyle(
                          color: textoPrincipal,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      content: const Text(
                        '¿Seguro que deseas salir?',
                        style: TextStyle(
                          color: textoSecundario,
                        ),
                      ),
                      actions: [
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancelar'),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: MiTema.verdePrincipal,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/login',
                              (Route<dynamic> route) => false,
                            );
                          },
                          child: const Text('Salir'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // ----------- Encabezado con avatar ----------
  Widget _buildHeader() {
    return Column(
      children: const [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.teal,
          backgroundImage: AssetImage('assets/img/perfil_default.png'),
        ),
        SizedBox(height: 10),
        Text(
          'Usuario',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 2),
        Text(
          'usuario@gmail.com',
          style: TextStyle(
            color: Color(0xFFBFC3CF),
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  // ----------- Títulos de sección ----------
  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 6),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // ----------- Item reutilizable ----------
  Widget _itemTile({
    required IconData icon,
    required String text,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    const Color card = Color(0xFF06261A);
    const Color textoPrincipal = Colors.white;
    const Color textoSecundario = Color(0xFFBFC3CF);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        margin: const EdgeInsets.only(bottom: 6),
        decoration: BoxDecoration(
          color: card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white24.withOpacity(0.08),
          ),
        ),
        child: ListTile(
          leading: Icon(icon, color: textoSecundario),
          title: Text(
            text,
            style: const TextStyle(
              color: textoPrincipal,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: subtitle == null
              ? null
              : Text(
                  subtitle,
                  style: const TextStyle(
                    color: textoSecundario,
                    fontSize: 13,
                  ),
                ),
          trailing:
              const Icon(Icons.chevron_right, color: textoSecundario, size: 20),
          onTap: onTap,
        ),
      ),
    );
  }
}
