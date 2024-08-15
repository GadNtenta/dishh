import 'package:flutter/material.dart';
import '../donnees_fictives_commandes.dart';

class DetailsCommandeNonConfirmee extends StatefulWidget {
  final Commande commande;

  DetailsCommandeNonConfirmee({required this.commande});

  @override
  _DetailsCommandeNonConfirmeeState createState() =>
      _DetailsCommandeNonConfirmeeState();
}

class _DetailsCommandeNonConfirmeeState
    extends State<DetailsCommandeNonConfirmee> {
  final TextEditingController _lieuLivraisonController =
  TextEditingController();
  final TextEditingController _dateLivraisonController =
  TextEditingController();
  final TextEditingController _tempsLivraisonController =
  TextEditingController();
  final TextEditingController _nomLivreurController = TextEditingController();
  final TextEditingController _numeroLivreurController =
  TextEditingController();
  final TextEditingController _numeroLivraisonController =
  TextEditingController();

  @override
  void initState() {
    super.initState();
    _lieuLivraisonController.text = widget.commande.lieuLivraison ?? '';
    _dateLivraisonController.text = widget.commande.dateLivraison ?? '';
    _tempsLivraisonController.text = widget.commande.tempsLivraison ?? '';
    _nomLivreurController.text = widget.commande.nomLivreur ?? '';
    _numeroLivreurController.text = widget.commande.numeroLivreur ?? '';
    _numeroLivraisonController.text = widget.commande.numeroLivraison ?? '';
  }

  void _confirmerCommande() {
    setState(() {
      widget.commande.statut = 'Confirmée';
      widget.commande.lieuLivraison = _lieuLivraisonController.text;
      widget.commande.dateLivraison = _dateLivraisonController.text;
      widget.commande.tempsLivraison = _tempsLivraisonController.text;
      widget.commande.nomLivreur = _nomLivreurController.text;
      widget.commande.numeroLivreur = _numeroLivreurController.text;
      widget.commande.numeroLivraison = _numeroLivraisonController.text;
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails de la Commande Non Confirmée'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Restaurant: ${widget.commande.nomRestaurant}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Articles: ${widget.commande.articles.join(", ")}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Prix Total: \$${widget.commande.prixTotal.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildTextField(
                      controller: _lieuLivraisonController,
                      label: 'Lieu de Livraison',
                      icon: Icons.location_on,
                    ),
                    const SizedBox(height: 12),
                    _buildTextField(
                      controller: _dateLivraisonController,
                      label: 'Date de Livraison',
                      icon: Icons.calendar_today,
                    ),
                    const SizedBox(height: 12),
                    _buildTextField(
                      controller: _tempsLivraisonController,
                      label: 'Temps de Livraison',
                      icon: Icons.timer,
                    ),
                    const SizedBox(height: 12),
                    _buildTextField(
                      controller: _nomLivreurController,
                      label: 'Nom du Livreur',
                      icon: Icons.person,
                    ),
                    const SizedBox(height: 12),
                    _buildTextField(
                      controller: _numeroLivreurController,
                      label: 'Numéro du Livreur',
                      icon: Icons.phone,
                    ),
                    const SizedBox(height: 12),
                    _buildTextField(
                      controller: _numeroLivraisonController,
                      label: 'Numéro de Livraison',
                      icon: Icons.local_shipping,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _confirmerCommande,
              icon: const Icon(Icons.check_circle),
              label: const Text('Confirmer la Commande'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.redAccent,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.redAccent),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
