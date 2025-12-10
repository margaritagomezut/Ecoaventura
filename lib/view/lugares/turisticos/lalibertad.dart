import 'package:flutter/material.dart';

class LaLibertad extends StatelessWidget {
  const LaLibertad({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mirador La Libertad'),
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
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/turisticos/lalibertad.jpg'),
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
                      'Mirador La Libertad, Chiapas',
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
                    'El Mirador La Libertad es uno de los lugares más emblemáticos de Ocosingo, Chiapas. '
                    'Desde este punto se puede disfrutar de una vista panorámica del paisaje montañoso y los valles que rodean la región. '
                    'Es un sitio perfecto para los visitantes que buscan tranquilidad y contacto directo con la naturaleza. '
                    'Además, es ideal para tomar fotografías, observar aves y disfrutar de los atardeceres que pintan el cielo de colores únicos.',
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
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.map),
                        label: const Text('Ver en mapa'),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 60, 179, 113),
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.map),
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
                        _galeriaItem('assets/img/turisticos/lalibertad-1.png'),
                        _galeriaItem('assets/img/turisticos/lalibertad-2.png'),
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
