import 'package:flutter/material.dart';
import '../theme/tema.dart';
import '../view/perfil.dart';
import 'bottom.dart';
import 'menu.dart';

class VistaInicio extends StatefulWidget {
  const VistaInicio({super.key, required this.title});
  final String title;

  @override
  State<VistaInicio> createState() => _VistaInicioState();
}

class _VistaInicioState extends State<VistaInicio> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchController = TextEditingController();
  int bottomIndex = 0;
  final Set<String> favorites = {};

  // Tabs de categorías
  final List<String> categoriasTabs = [
    'Lugares',
    'Hoteles',
    'Restaurantes',
    'Transporte',
    'Más',
  ];
  int selectedTabIndex = 0;

  // ------------------------------- DATA ----------------------------------
  final Map<String, dynamic> data = {
    'Lugares': {
      'Turísticos': [
        {
          'id': 't1',
          'nombre': 'Toniná',
          'ubicacion': 'Zona Arqueológica',
          'imagen': 'assets/img/turisticos/tonina.jpg',
          'ruta': '/lugares/turisticos/tonina'
        },
        {
          'id': 't2',
          'nombre': 'Plan de Ayutla',
          'ubicacion': 'Zona Arqueológica',
          'imagen': 'assets/img/turisticos/ayutla-1.png',
          'ruta': '/lugares/turisticos/ayutla'
        },
        {
          'id': 't3',
          'nombre': 'Mirador la Ventana',
          'ubicacion': 'Zona Arqueológica',
          'imagen': 'assets/img/turisticos/mirador-1.png',
          'ruta': '/lugares/turisticos/laventana'
        },
        {
          'id': 't4',
          'nombre': 'Mirador la Libertad',
          'ubicacion': 'Zona Arqueológica',
          'imagen': 'assets/img/turisticos/libertad-1.png',
          'ruta': '/lugares/turisticos/lalibertad'
        },
      ],

      // ---------------- ECOTURÍSTICOS ----------------
      'Ecoturísticos': [
        {
          'id': 'e1',
          'nombre': 'Nahá',
          'ubicacion': 'Reserva Natural',
          'imagen': 'assets/img/ecoturisticos/naha.jpg',
          'ruta': '/lugares/ecoturisticos/naha'
        },
        {
          'id': 'e2',
          'nombre': 'Metzabook',
          'ubicacion': 'Reserva Natural',
          'imagen': 'assets/img/ecoturisticos/metzabook.jpg',
          'ruta': '/lugares/ecoturisticos/metzabook'
        },
        {
          'id': 'e3',
          'nombre': 'Laguna de Miramar',
          'ubicacion': 'Reserva Natural',
          'imagen': 'assets/img/ecoturisticos/miramar-1.png',
          'ruta': '/lugares/ecoturisticos/lagunamiramar'
        },
        {
          'id': 'e4',
          'nombre': 'Cascadas Sej-Kajub',
          'ubicacion': 'Reserva Natural',
          'imagen': 'assets/img/ecoturisticos/sej-kajub-1.png',
          'ruta': '/lugares/ecoturisticos/sejkajub'
        },
        {
          'id': 'e5',
          'nombre': 'Lacanja Tzeltal',
          'ubicacion': 'Reserva Natural',
          'imagen': 'assets/img/ecoturisticos/lacanja-1.png',
          'ruta': '/lugares/ecoturisticos/lacanjatzeltal'
        },
        {
          'id': 'e6',
          'nombre': 'Cascadas Xánil',
          'ubicacion': 'Reserva Natural',
          'imagen': 'assets/img/ecoturisticos/xanil-1.png',
          'ruta': '/lugares/ecoturisticos/xanil'
        },
        {
          'id': 'e7',
          'nombre': 'Laguna Siete Colores',
          'ubicacion': 'Reserva Natural',
          'imagen': 'assets/img/ecoturisticos/siete-colores-1.png',
          'ruta': '/lugares/ecoturisticos/sietecolores'
        },
      ],

      // ---------------- BALNEARIOS ----------------
      'Balnearios': [
        {
          'id': 'b1',
          'nombre': 'Tío Dimas',
          'ubicacion': 'Balneario',
          'imagen': 'assets/img/balnearios/dimas-1.png',
          'ruta': '/lugares/balnearios/tiodimas'
        },
        {
          'id': 'b2',
          'nombre': 'El Encanto',
          'ubicacion': 'Balneario',
          'imagen': 'assets/img/balnearios/encanto-1.png',
          'ruta': '/lugares/balnearios/elencanto'
        },
        {
          'id': 'b3',
          'nombre': 'La Técnica',
          'ubicacion': 'Balneario',
          'imagen': 'assets/img/balnearios/tecnica-1.png',
          'ruta': '/lugares/balnearios/latecnica'
        },
        {
          'id': 'b4',
          'nombre': 'Los Reyes',
          'ubicacion': 'Balneario',
          'imagen': 'assets/img/balnearios/reyes-1.png',
          'ruta': '/lugares/balnearios/losreyes'
        },
        {
          'id': 'b5',
          'nombre': 'Rancho El Mirador',
          'ubicacion': 'Balneario',
          'imagen': 'assets/img/balnearios/rancho-1.png',
          'ruta': '/lugares/balnearios/ranchomirador'
        },
        {
          'id': 'b6',
          'nombre': 'Río Jataté',
          'ubicacion': 'Balneario',
          'imagen': 'assets/img/balnearios/jatate-1.png',
          'ruta': '/lugares/balnearios/riojatate'
        },
      ],
    },

    // ---------------- HOTEL ----------------
    'Hoteles': [
      {
        'id': 'h1',
        'nombre': 'Hotel Central',
        'ubicacion': 'Centro',
        'imagen': 'assets/lugares/hotel1.jpg'
      },
      {
        'id': 'h2',
        'nombre': 'EcoLodge',
        'ubicacion': 'Periferia',
        'imagen': 'assets/lugares/hotel2.jpg'
      },
    ],

    // ---------------- RESTAURANTES ----------------
    'Restaurantes': [
      {
        'id': 'r1',
        'nombre': 'Comedor Local',
        'ubicacion': 'Mercado',
        'imagen': 'assets/lugares/rest1.jpg'
      },
    ],

    // ---------------- TRANSPORTE ----------------
    'Transporte': [
      {
        'id': 'tr1',
        'nombre': 'Terminal',
        'ubicacion': 'Zona centro',
        'imagen': 'assets/lugares/trans1.jpg'
      },
    ],
  };

  // -----------------------------------------------------------------

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _toggleFavorite(String id) {
    setState(() {
      favorites.contains(id) ? favorites.remove(id) : favorites.add(id);
    });
  }

  // ------------------ HERO PRINCIPAL ------------------
  Widget _buildHeroSection() {
    final Map<String, dynamic> tonina =
        (data['Lugares']['Turísticos'] as List<dynamic>)[0]
            as Map<String, dynamic>;

    return SizedBox(
      height: 360,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              tonina['imagen'] as String, // ← CAST A STRING
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.85),
                    Colors.black.withOpacity(0.25),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Barra superior
                  Row(
                    children: [
                      Material(
                        color: Colors.black.withOpacity(0.6),
                        shape: const CircleBorder(),
                        child: IconButton(
                          icon: const Icon(Icons.menu, color: Colors.white),
                          onPressed: () =>
                              _scaffoldKey.currentState?.openDrawer(),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          height: 44,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.search,
                                  color: Colors.white70, size: 20),
                              const SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  controller: _searchController,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                  decoration: const InputDecoration(
                                    hintText:
                                        'Encuentra lugares y actividades',
                                    hintStyle: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Material(
                        color: Colors.black.withOpacity(0.6),
                        shape: const CircleBorder(),
                        child: IconButton(
                          icon: const Icon(Icons.notifications_none,
                              color: Colors.white),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('No hay notificaciones')),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  const Text(
                    'Recuerdos de viaje\nque nunca olvidarás',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Explora lo mejor de Ocosingo: arqueología,\nselva, cascadas y cultura viva.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ------------------ TABS ------------------
  Widget _buildCategoryTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categoriasTabs.length, (index) {
          final bool selected = index == selectedTabIndex;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedTabIndex = index;
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: selected
                      ? Colors.white
                      : Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: selected
                        ? MiTema.verdePrincipal
                        : Colors.white24,
                  ),
                ),
                child: Text(
                  categoriasTabs[index],
                  style: TextStyle(
                    color: selected ? Colors.black : Colors.white,
                    fontWeight: selected ? FontWeight.bold : FontWeight.w400,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  // ------------------ CARD HORIZONTAL ------------------
  Widget _horizontalDestinationCard(
    Map<String, String> item, {
    required String etiqueta,
    required String subtitulo,
  }) {
    final String id = item['id'] ?? item['nombre']!;
    final bool isFav = favorites.contains(id);

    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          if (item.containsKey('ruta')) {
            Navigator.pushNamed(context, item['ruta']!);
          }
        },
        child: Container(
          width: 230,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.40),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    item['imagen']!, // ← AQUÍ EL !
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.75),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 10,
                  top: 10,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.92),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      etiqueta,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: MiTema.grisOscuro,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  right: 10,
                  top: 10,
                  child: Material(
                    color: Colors.white.withOpacity(0.92),
                    shape: const CircleBorder(),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 22,
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color:
                            isFav ? Colors.red : MiTema.verdePrincipal,
                      ),
                      onPressed: () => _toggleFavorite(id),
                    ),
                  ),
                ),

                Positioned(
                  left: 12,
                  bottom: 14,
                  right: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['nombre']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitulo,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ------------------ SECCIÓN COMPLETA ------------------
  Widget _experienceSection({
    required String titulo,
    required List<Map<String, String>> items,
    required String subtituloBase,
    bool enumerar = false,
  }) {
    if (items.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 210,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                final etiqueta = enumerar
                    ? '${index + 1}. ${item['nombre']}'
                    : item['nombre']!;
                return _horizontalDestinationCard(
                  item,
                  etiqueta: etiqueta,
                  subtitulo: subtituloBase,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ------------------ CONTENIDO DINÁMICO ------------------
  Widget _inicioContenido() {
    final List<Map<String, String>> turisticos =
        List<Map<String, String>>.from(data['Lugares']['Turísticos']);
    final List<Map<String, String>> ecoturisticos =
        List<Map<String, String>>.from(data['Lugares']['Ecoturísticos']);
    final List<Map<String, String>> balnearios =
        List<Map<String, String>>.from(data['Lugares']['Balnearios']);
    final List<Map<String, String>> hoteles =
        List<Map<String, String>>.from(data['Hoteles']);
    final List<Map<String, String>> restaurantes =
        List<Map<String, String>>.from(data['Restaurantes']);
    final List<Map<String, String>> transporte =
        List<Map<String, String>>.from(data['Transporte']);

    final List<Widget> secciones = [];

    if (selectedTabIndex == 0) {
      // ---------------------- LUGARES -----------------------
      secciones.addAll([
        // TURÍSTICOS
        _experienceSection(
          titulo: 'Experiencias de viaje inolvidables (Turísticos)',
          items: turisticos,
          subtituloBase: 'Zonas arqueológicas y lugares históricos.',
        ),
        const SizedBox(height: 28),

        // ECOTURÍSTICOS
        _experienceSection(
          titulo: 'Explora la belleza natural (Ecoturísticos)',
          items: ecoturisticos,
          subtituloBase: 'Selva, lagunas y cascadas de Ocosingo.',
        ),
        const SizedBox(height: 28),

        // BALNEARIOS
        _experienceSection(
          titulo: 'Balnearios ideales para relajarte',
          items: balnearios,
          subtituloBase: 'Ríos, pozas y balnearios naturales.',
        ),
      ]);
    } else if (selectedTabIndex == 1) {
      // ---------------------- HOTELES -----------------------
      secciones.addAll([
        _experienceSection(
          titulo: 'Hoteles recomendados para ti',
          items: hoteles,
          subtituloBase: 'Hospédate cerca de tus actividades favoritas.',
        ),
      ]);
    } else if (selectedTabIndex == 2) {
      // ---------------------- RESTAURANTES -----------------------
      secciones.addAll([
        _experienceSection(
          titulo: 'Sabores que tienes que probar',
          items: restaurantes,
          subtituloBase: 'Cocina local, mercados y comida tradicional.',
        ),
      ]);
    } else if (selectedTabIndex == 3) {
      // ---------------------- TRANSPORTE -----------------------
      secciones.addAll([
        _experienceSection(
          titulo: 'Muévete por Ocosingo',
          items: transporte,
          subtituloBase: 'Terminales y puntos clave para tu trayecto.',
        ),
      ]);
    }

    return Container(
      color: Colors.black,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroSection(),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildCategoryTabs(),
            ),
            const SizedBox(height: 28),
            ...secciones,
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // ------------------ SCAFFOLD ------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: menu(context),
      body: IndexedStack(
        index: bottomIndex,
        children: [
          _inicioContenido(),
          const Center(child: Text('Favoritos')),
          const Center(child: Text('Navegar')),
          const PerfilPage(),
        ],
      ),
      bottomNavigationBar: menuBottom(context, bottomIndex, (value) {
        setState(() => bottomIndex = value);
      }),
    );
  }
}
