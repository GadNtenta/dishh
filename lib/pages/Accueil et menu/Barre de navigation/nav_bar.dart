import 'package:flutter/material.dart';

class BarreNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BarreNavigation({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant_menu),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: 'Catégories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Commandes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Compte',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      onTap: onTap,
    );
  }
}
