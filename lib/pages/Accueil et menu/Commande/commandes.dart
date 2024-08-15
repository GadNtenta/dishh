import 'package:flutter/material.dart';
import '../Barre de navigation/nav_bar.dart';
import '../Barre de navigation/routes.dart';
import 'CarteCommande.dart';
import 'donnees_fictives_commandes.dart';
import 'etats des commandes/commandes_confirmees.dart';
import 'etats des commandes/commandes_en_attente.dart';
import 'etats des commandes/commandes_non_confirmees.dart'; // Importation des données fictives

class PageCommandes extends StatefulWidget {
  @override
  _PageCommandesState createState() => _PageCommandesState();
}

class _PageCommandesState extends State<PageCommandes> {
  String filtreSelectionne = 'Toutes'; // Filtre par défaut pour afficher toutes les commandes
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    List<Commande> commandesFiltrees = commandes.where((commande) {
      if (filtreSelectionne == 'Toutes') return true;
      return commande.statut == filtreSelectionne;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Commandes'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (valeur) {
              setState(() {
                filtreSelectionne = valeur;
              });
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(value: 'Toutes', child: Text('Toutes les Commandes')),
                const PopupMenuItem(value: 'Confirmée', child: Text('Confirmées')),
                const PopupMenuItem(value: 'En attente', child: Text('En attente')),
                const PopupMenuItem(value: 'Non confirmée', child: Text('Non confirmées')),
              ];
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: commandesFiltrees.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (commandesFiltrees[index].statut == 'En attente') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsCommandeEnAttente(
                      commande: commandesFiltrees[index],
                    ),
                  ),
                );
              } else if (commandesFiltrees[index].statut == 'Non confirmée') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsCommandeNonConfirmee(
                      commande: commandesFiltrees[index],
                    ),
                  ),
                );
              } else if (commandesFiltrees[index].statut == 'Confirmée') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsCommandeConfirmee(
                      commande: commandesFiltrees[index],
                    ),
                  ),
                );
              }
            },
            child: CarteCommande(commande: commandesFiltrees[index]),
          );
        },
      ),
      bottomNavigationBar: BarreNavigation(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          onItemTapped(context, index);  // Utilisation de la méthode importée
        },
      ),
    );
  }
}
