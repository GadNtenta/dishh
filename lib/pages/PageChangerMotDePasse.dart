import 'package:flutter/material.dart';

class PageChangerMotDePasse extends StatelessWidget {
  const PageChangerMotDePasse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Changer le Mot de Passe'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Mot de Passe Actuel',
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),
            const SizedBox(height: 16.0),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Nouveau Mot de Passe',
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),
            const SizedBox(height: 16.0),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirmer le Nouveau Mot de Passe',
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                child: const Text('Changer le Mot de Passe'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
