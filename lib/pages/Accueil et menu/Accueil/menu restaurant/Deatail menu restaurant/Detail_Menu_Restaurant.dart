import 'package:flutter/material.dart';

class PageDetailMenu extends StatelessWidget {
  final String nomMenu;
  final String imageMenu;
  final String descriptionMenu;
  final double prixMenu;

  const PageDetailMenu({
    required this.nomMenu,
    required this.imageMenu,
    required this.descriptionMenu,
    required this.prixMenu,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nomMenu),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                imageMenu,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              nomMenu,
              style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              descriptionMenu,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Prix : \$${prixMenu.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logique pour passer la commande
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Commande de $nomMenu passée avec succès!'),
                    ),
                  );
                },
                child: const Text('Commander'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                  backgroundColor: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
