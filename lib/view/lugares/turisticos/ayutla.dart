import 'package:flutter/material.dart';

class PlanAyutla extends StatelessWidget {
  const PlanAyutla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zona Arqueológica de Plan de Ayutla'),
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
                      image: AssetImage('assets/img/turisticos/ayutla-1.png'),
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
                      'Plan de Ayutla, Chiapas',
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
                    'La zona arqueológica de Plan de Ayutla se encuentra en el municipio de Ocosingo, Chiapas. '
                    'Fue una importante ciudad maya durante el periodo Clásico, destacando por sus templos, plazas y estructuras residenciales. '
                    'Actualmente se pueden apreciar vestigios de su arquitectura monumental y esculturas que muestran la historia y cultura de la región. '
                    'El sitio ofrece recorridos guiados y vistas impresionantes de la selva chiapaneca, ideales para quienes buscan conocer más sobre la civilización maya.',
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
                        _galeriaItem('assets/img/turisticos/ayutla-1.png'),
                        _galeriaItem('assets/img/turisticos/ayutla-2.png'),
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
