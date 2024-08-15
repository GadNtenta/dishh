import 'package:flutter/material.dart';
import '../Composants/carte_categorie.dart';

class GrilleCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: const [
          CarteCategorie('Fast Food', 'assets/images/fruits.png'),
          CarteCategorie('Breakfast & Brunch', 'assets/images/fruits.png'),
          CarteCategorie('Mexicain', 'assets/images/tacos.png'),
          CarteCategorie('Boulangerie', 'assets/images/chocolatine.png'),
          CarteCategorie('Desserts', 'assets/images/dej.png'),
          CarteCategorie('Burgers', 'assets/images/burgers.png'),
        ],
      ),
    );
  }
}
