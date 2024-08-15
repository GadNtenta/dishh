import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../Barre de navigation/nav_bar.dart';
import '../Barre de navigation/routes.dart';
import 'menu restaurant/MenuRestaurant.dart';

class MenuAccueil extends StatefulWidget {
  const MenuAccueil({super.key});

  @override
  _MenuAccueilState createState() => _MenuAccueilState();
}

class _MenuAccueilState extends State<MenuAccueil> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            filled: true,
            fillColor: Color(0xFFF1F1F1),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('restaurant').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Quelque chose a mal tourné'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final data = snapshot.requireData;

            return GridView.builder(
              itemCount: data.size,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (BuildContext context, int index) {
                final restaurant = data.docs[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RestaurantDetailPage(
                          restaurantId: restaurant.id,
                        ),
                      ),
                    );
                  },
                  child: buildFoodCard(restaurant),
                );
              },
            );
          },
        ),
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

  Widget buildFoodCard(QueryDocumentSnapshot doc) {
    final food = doc.data() as Map<String, dynamic>;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 0, // Remove shadow for a flatter look
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          image: DecorationImage(
            image: CachedNetworkImageProvider(food['image']),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
                color: Colors.black.withOpacity(0.5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.timer, color: Colors.white, size: 14.0),
                        const SizedBox(width: 4.0),
                        Text(
                          food['time'],
                          style: const TextStyle(color: Colors.white, fontSize: 12.0),
                        ),
                        const SizedBox(width: 8.0),
                        const Icon(Icons.attach_money, color: Colors.white, size: 14.0),
                        const SizedBox(width: 4.0),
                        Text(
                          food['price'],
                          style: const TextStyle(color: Colors.white, fontSize: 12.0),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFBB91B),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            food['rating'],
                            style: const TextStyle(color: Colors.white, fontSize: 12.0),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      food['name'],
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      food['cuisine'],
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
