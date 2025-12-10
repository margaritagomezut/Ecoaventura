import 'package:flutter/material.dart';
import '../theme/tema.dart';

Widget menuBottom(BuildContext context, int selectedIndex, Function(int) onTap) {
  return BottomNavigationBar(
    currentIndex: selectedIndex,
    onTap: (index) {
      onTap(index); // Actualiza el índice, NO usamos Navigator.push
    },
    selectedItemColor: MiTema.verdePrincipal,
    unselectedItemColor: MiTema.grisOscuro,
    backgroundColor: MiTema.verdeSecundario,
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Explorar',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: 'Favoritos',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.assistant_navigation),
        label: 'Navegar',
      ),
      // BottomNavigationBarItem(
      //   icon: Icon(Icons.confirmation_num),
      //   label: 'Reservas',
      // ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_rounded),
        label: 'Perfil',
      ),
    ],
  );
}








