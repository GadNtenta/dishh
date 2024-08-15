import 'package:flutter/material.dart';
import '../Barre de navigation/nav_bar.dart';
import '../Barre de navigation/routes.dart';
import 'donnees_categories/grille_categories.dart';

class PageCategorie extends StatefulWidget {
  @override
  _PageCategorieState createState() => _PageCategorieState();
}

class _PageCategorieState extends State<PageCategorie> {
  int _selectedIndex = 1;  // Index de la page 'Catégories'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Recherche',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChampRecherche(),
            const SizedBox(height: 20),
            const TexteTitre('Top Catégories'),
            const SizedBox(height: 20),
            GrilleCategories(),
          ],
        ),
      ),
      bottomNavigationBar: BarreNavigation(
        currentIndex: _selectedIndex,
        onTap: (index) {
          onItemTapped(context, index);
        },
      ),
    );
  }
}

class ChampRecherche extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Rechercher sur dishh',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}

class TexteTitre extends StatelessWidget {
  final String texte;

  const TexteTitre(this.texte);

  @override
  Widget build(BuildContext context) {
    return Text(
      texte,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
