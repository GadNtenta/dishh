import 'package:flutter/material.dart';
import 'donnees_fictives_commandes.dart';

class CarteCommande extends StatelessWidget {
  final Commande commande;

  CarteCommande({required this.commande});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              commande.nomRestaurant,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Articles: ${commande.articles.join(', ')}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Prix Total: \$${commande.prixTotal.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Statut: ${commande.statut}',
              style: TextStyle(
                color: commande.statut == 'Confirmée'
                    ? Colors.green
                    : commande.statut == 'En attente'
                    ? Colors.orange
                    : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
