import 'package:flutter/material.dart';

class Tonina extends StatelessWidget {
  const Tonina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zona Arqueológica de Toniná'),
        backgroundColor: const Color.fromARGB(255, 20, 195, 162),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner con imagen principal
            Stack(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/img/turisticos/tonina.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    color: Colors.black54,
                    child: const Text(
                      'Toniná, Chiapas',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Información
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Descripción',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Toniná es una zona arqueológica ubicada en Chiapas, famosa por su gran pirámide y esculturas de la cultura maya. '
                    'Ofrece recorridos guiados, miradores panorámicos y actividades culturales para toda la familia.',
                    style: TextStyle(fontSize: 15, color: Colors.black87),
                  ),

                  const SizedBox(height: 16),

                  // Botones de acción
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 60, 179, 113),
                          foregroundColor: Colors.white,), // cambia el color del texto e icono
                        onPressed: () {},
                        icon: const Icon(Icons.map),
                        label: const Text('Ver en mapa'),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 60, 179, 113),
                          foregroundColor: Colors.white,), // cambia el color del texto e icono
                        onPressed: () {},
                        icon: const Icon(Icons.where_to_vote_rounded),
                        label: const Text('Actividades'),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Galería de imágenes
                  const Text(
                    'Galería',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _galeriaItem('assets/img/turisticos/tonina-1.png'),
                        _galeriaItem('assets/img/turisticos/tonina-2.png'),
                        _galeriaItem('assets/img/turisticos/tonina2.jpg'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _galeriaItem(String path) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(path, width: 160, fit: BoxFit.cover),
      ),
    );
  }
}

