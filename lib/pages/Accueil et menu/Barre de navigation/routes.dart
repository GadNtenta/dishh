// navigation_handler.dart

import 'package:flutter/material.dart';
import '../Accueil/MenuAccueil.dart';
import '../Commande/commandes.dart';
import '../categories_restaurant/categories_restaurant.dart';

void onItemTapped(BuildContext context, int index) {
  if (index == 0) {
    Navigator.pop(context);  // Retourne à la page d'accueil
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuAccueil()));
  } else if (index == 1) {
    // Naviguer vers la page des catégories
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PageCategorie()));
  } else if (index == 2) {
    // Naviguer vers la page des commandes
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PageCommandes()));
  } else if (index == 3) {
    // Naviguer vers la page du compte utilisateur
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ComptePage()));
  }
}
