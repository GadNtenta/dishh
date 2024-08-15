import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RestaurantDetailPage extends StatelessWidget {
  final String restaurantId;

  const RestaurantDetailPage({required this.restaurantId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('restaurant').doc(restaurantId).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Quelque chose a mal tourné'));
          }
          var restaurant = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: restaurant['image'],
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 40,
                      left: 10,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(restaurant['image']),
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            restaurant['rating'],
                            style: const TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                          const Icon(Icons.star, color: Colors.white, size: 16.0),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant['name'],
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        restaurant['description'],
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.grey),
                          const SizedBox(width: 8.0),
                          Text(restaurant['address']),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          const Icon(Icons.phone, color: Colors.grey),
                          const SizedBox(width: 8.0),
                          Text(restaurant['phone']),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          const Icon(Icons.timer, color: Colors.grey),
                          const SizedBox(width: 8.0),
                          Text(restaurant['hours']),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          const Icon(Icons.money, color: Colors.grey),
                          const SizedBox(width: 8.0),
                          Text('Prix moyen : \$${restaurant['price']}'),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Menu',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      SizedBox(
                        height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: restaurant['menu']
                              .map<Widget>((menuItem) => buildMenuItem(context, menuItem))
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Maps',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        height: 200,
                        color: Colors.grey[300],
                        child: const Center(
                          child: Text('Map Placeholder'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildMenuItem(BuildContext context, Map<String, dynamic> menuItem) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: menuItem['image'],
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 4.0),
          Text(menuItem['name']),
        ],
      ),
    );
  }
}
