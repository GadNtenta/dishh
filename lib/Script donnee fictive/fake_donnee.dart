import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RestaurantHomePage(),
    );
  }
}

class RestaurantHomePage extends StatefulWidget {
  @override
  _RestaurantHomePageState createState() => _RestaurantHomePageState();
}

class _RestaurantHomePageState extends State<RestaurantHomePage> {
  @override
  void initState() {
    super.initState();
    _addRestaurantsToCollection();
  }

  void _addRestaurantsToCollection() async {
    List<Map<String, dynamic>> restaurants = _getFixedRestaurants();

    for (var restaurant in restaurants) {
      await FirebaseFirestore.instance.collection('restaurants').add(restaurant);
    }

    // Affiche un message de succès
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('20 restaurants ont été ajoutés à Firestore!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant List'),
      ),
      body: Center(
        child: Text('Ajout de restaurants en cours...'),
      ),
    );
  }

  List<Map<String, dynamic>> _getFixedRestaurants() {
    return [
      {
        'cuisine': 'Italian',
        'image': 'https://www.google.com/imgres?q=bouffe&imgurl=https%3A%2F%2Fanouslescaribous.com%2Fwp-content%2Fuploads%2F2020%2F11%2Fadresse-bouffe-plateau-montreal.jpg&imgrefurl=https%3A%2F%2Fanouslescaribous.com%2Fbouffe-reconfortante-plateau-mont-royal%2F&docid=djjr5aOPt92IjM&tbnid=wmo6-FX7rooC4M&vet=12ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA..i&w=2048&h=1365&hcb=2&ved=2ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA',
        'name': 'Italian Delights',
        'price': '15-50',
        'rating': '4.6',
        'time': '25-55 mins',
        'description': 'Traditional Italian dishes with a modern twist.',
        'address': '1919 Birch St, Cityville, CA 12365',
        'phone': '+1 555-100-1021',
        'hours': 'Mon-Sun: 11:00 AM - 10:00 PM',
        'menu': [
          {'name': 'Lasagna', 'description': 'Layers of pasta with meat sauce and cheese.', 'price': '16.99', 'image': 'https://www.google.com/imgres?q=bouffe&imgurl=https%3A%2F%2Fanouslescaribous.com%2Fwp-content%2Fuploads%2F2020%2F11%2Fadresse-bouffe-plateau-montreal.jpg&imgrefurl=https%3A%2F%2Fanouslescaribous.com%2Fbouffe-reconfortante-plateau-mont-royal%2F&docid=djjr5aOPt92IjM&tbnid=wmo6-FX7rooC4M&vet=12ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA..i&w=2048&h=1365&hcb=2&ved=2ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA'},
          {'name': 'Tiramisu', 'description': 'Classic Italian dessert with coffee and mascarpone.', 'price': '7.99', 'image': 'https://www.google.com/imgres?q=bouffe&imgurl=https%3A%2F%2Fanouslescaribous.com%2Fwp-content%2Fuploads%2F2020%2F11%2Fadresse-bouffe-plateau-montreal.jpg&imgrefurl=https%3A%2F%2Fanouslescaribous.com%2Fbouffe-reconfortante-plateau-mont-royal%2F&docid=djjr5aOPt92IjM&tbnid=wmo6-FX7rooC4M&vet=12ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA..i&w=2048&h=1365&hcb=2&ved=2ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA'}
        ],
      },
      {
        'cuisine': 'Japanese',
        'image': 'https://www.google.com/imgres?q=bouffe&imgurl=https%3A%2F%2Fanouslescaribous.com%2Fwp-content%2Fuploads%2F2020%2F11%2Fadresse-bouffe-plateau-montreal.jpg&imgrefurl=https%3A%2F%2Fanouslescaribous.com%2Fbouffe-reconfortante-plateau-mont-royal%2F&docid=djjr5aOPt92IjM&tbnid=wmo6-FX7rooC4M&vet=12ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA..i&w=2048&h=1365&hcb=2&ved=2ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA',
        'name': 'Sakura Sushi',
        'price': '18-55',
        'rating': '4.7',
        'time': '20-45 mins',
        'description': 'Fresh sushi and traditional Japanese dishes in a serene setting.',
        'address': '2020 Cedar St, Cityville, CA 12366',
        'phone': '+1 555-100-1022',
        'hours': 'Mon-Sun: 11:00 AM - 10:00 PM',
        'menu': [
          {'name': 'Sashimi Platter', 'description': 'Selection of fresh sashimi with dipping sauces.', 'price': '22.99', 'image': 'https://www.google.com/imgres?q=bouffe&imgurl=https%3A%2F%2Fanouslescaribous.com%2Fwp-content%2Fuploads%2F2020%2F11%2Fadresse-bouffe-plateau-montreal.jpg&imgrefurl=https%3A%2F%2Fanouslescaribous.com%2Fbouffe-reconfortante-plateau-mont-royal%2F&docid=djjr5aOPt92IjM&tbnid=wmo6-FX7rooC4M&vet=12ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA..i&w=2048&h=1365&hcb=2&ved=2ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA'},
          {'name': 'Tempura Udon', 'description': 'Udon noodles with crispy tempura and broth.', 'price': '14.49', 'image': 'https://www.google.com/imgres?q=bouffe&imgurl=https%3A%2F%2Fanouslescaribous.com%2Fwp-content%2Fuploads%2F2020%2F11%2Fadresse-bouffe-plateau-montreal.jpg&imgrefurl=https%3A%2F%2Fanouslescaribous.com%2Fbouffe-reconfortante-plateau-mont-royal%2F&docid=djjr5aOPt92IjM&tbnid=wmo6-FX7rooC4M&vet=12ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA..i&w=2048&h=1365&hcb=2&ved=2ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA'}
        ],
      },
      {
        'cuisine': 'Mexican',
        'image': 'https://www.google.com/imgres?q=bouffe&imgurl=https%3A%2F%2Fanouslescaribous.com%2Fwp-content%2Fuploads%2F2020%2F11%2Fadresse-bouffe-plateau-montreal.jpg&imgrefurl=https%3A%2F%2Fanouslescaribous.com%2Fbouffe-reconfortante-plateau-mont-royal%2F&docid=djjr5aOPt92IjM&tbnid=wmo6-FX7rooC4M&vet=12ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA..i&w=2048&h=1365&hcb=2&ved=2ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA',
        'name': 'Mexican Treats',
        'price': '10-40',
        'rating': '4.4',
        'time': '20-50 mins',
        'description': 'Mexican comfort food with a variety of flavorful dishes.',
        'address': '2121 Pine St, Cityville, CA 12367',
        'phone': '+1 555-100-1023',
        'hours': 'Mon-Sun: 10:00 AM - 11:00 PM',
        'menu': [
          {'name': 'Chimichangas', 'description': 'Deep-fried burritos with a choice of filling.', 'price': '11.99', 'image': 'https://www.google.com/imgres?q=bouffe&imgurl=https%3A%2F%2Fanouslescaribous.com%2Fwp-content%2Fuploads%2F2020%2F11%2Fadresse-bouffe-plateau-montreal.jpg&imgrefurl=https%3A%2F%2Fanouslescaribous.com%2Fbouffe-reconfortante-plateau-mont-royal%2F&docid=djjr5aOPt92IjM&tbnid=wmo6-FX7rooC4M&vet=12ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA..i&w=2048&h=1365&hcb=2&ved=2ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA'},
          {'name': 'Margaritas', 'description': 'Classic margarita with fresh lime and tequila.', 'price': '8.99', 'image': 'https://www.google.com/imgres?q=bouffe&imgurl=https%3A%2F%2Fanouslescaribous.com%2Fwp-content%2Fuploads%2F2020%2F11%2Fadresse-bouffe-plateau-montreal.jpg&imgrefurl=https%3A%2F%2Fanouslescaribous.com%2Fbouffe-reconfortante-plateau-mont-royal%2F&docid=djjr5aOPt92IjM&tbnid=wmo6-FX7rooC4M&vet=12ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA..i&w=2048&h=1365&hcb=2&ved=2ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA'}
        ],
      },
      {
        'cuisine': 'Indian',
        'image': 'https://www.google.com/imgres?q=bouffe&imgurl=https%3A%2F%2Fanouslescaribous.com%2Fwp-content%2Fuploads%2F2020%2F11%2Fadresse-bouffe-plateau-montreal.jpg&imgrefurl=https%3A%2F%2Fanouslescaribous.com%2Fbouffe-reconfortante-plateau-mont-royal%2F&docid=djjr5aOPt92IjM&tbnid=wmo6-FX7rooC4M&vet=12ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA..i&w=2048&h=1365&hcb=2&ved=2ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA',
        'name': 'Taj Mahal',
        'price': '15-50',
        'rating': '4.8',
        'time': '30-60 mins',
        'description': 'Indian cuisine with an emphasis on rich flavors and aromatic spices.',
        'address': '2222 Oak Ave, Cityville, CA 12368',
        'phone': '+1 555-100-1024',
        'hours': 'Mon-Sun: 11:00 AM - 10:00 PM',
        'menu': [
          {'name': 'Chicken Tikka Masala', 'description': 'Grilled chicken in a spiced tomato cream sauce.', 'price': '16.49', 'image': 'https://www.google.com/imgres?q=bouffe&imgurl=https%3A%2F%2Fanouslescaribous.com%2Fwp-content%2Fuploads%2F2020%2F11%2Fadresse-bouffe-plateau-montreal.jpg&imgrefurl=https%3A%2F%2Fanouslescaribous.com%2Fbouffe-reconfortante-plateau-mont-royal%2F&docid=djjr5aOPt92IjM&tbnid=wmo6-FX7rooC4M&vet=12ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA..i&w=2048&h=1365&hcb=2&ved=2ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA'},
          {'name': 'Raita', 'description': 'Yogurt-based side dish with cucumber and spices.', 'price': '5.49', 'image': 'https://www.google.com/imgres?q=bouffe&imgurl=https%3A%2F%2Fanouslescaribous.com%2Fwp-content%2Fuploads%2F2020%2F11%2Fadresse-bouffe-plateau-montreal.jpg&imgrefurl=https%3A%2F%2Fanouslescaribous.com%2Fbouffe-reconfortante-plateau-mont-royal%2F&docid=djjr5aOPt92IjM&tbnid=wmo6-FX7rooC4M&vet=12ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA..i&w=2048&h=1365&hcb=2&ved=2ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA'}
        ],
      },
      {
        'cuisine': 'French',
        'image': 'https://www.google.com/imgres?q=bouffe&imgurl=https%3A%2F%2Fanouslescaribous.com%2Fwp-content%2Fuploads%2F2020%2F11%2Fadresse-bouffe-plateau-montreal.jpg&imgrefurl=https%3A%2F%2Fanouslescaribous.com%2Fbouffe-reconfortante-plateau-mont-royal%2F&docid=djjr5aOPt92IjM&tbnid=wmo6-FX7rooC4M&vet=12ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA..i&w=2048&h=1365&hcb=2&ved=2ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA',
        'name': 'French Delicacies',
        'price': '20-60',
        'rating': '4.7',
        'time': '35-70 mins',
        'description': 'Fine dining with classic French dishes and elegant presentation.',
        'address': '2323 Maple St, Cityville, CA 12369',
        'phone': '+1 555-100-1025',
        'hours': 'Tue-Sun: 12:00 PM - 11:00 PM',
        'menu': [
          {'name': 'Coq au Vin', 'description': 'Chicken braised with red wine, mushrooms, and onions.', 'price': '24.99', 'image': 'https://www.google.com/imgres?q=bouffe&imgurl=https%3A%2F%2Fanouslescaribous.com%2Fwp-content%2Fuploads%2F2020%2F11%2Fadresse-bouffe-plateau-montreal.jpg&imgrefurl=https%3A%2F%2Fanouslescaribous.com%2Fbouffe-reconfortante-plateau-mont-royal%2F&docid=djjr5aOPt92IjM&tbnid=wmo6-FX7rooC4M&vet=12ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA..i&w=2048&h=1365&hcb=2&ved=2ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA'},
          {'name': 'Crème Brûlée', 'description': 'Rich custard topped with caramelized sugar.', 'price': '9.99', 'image': 'https://www.google.com/imgres?q=bouffe&imgurl=https%3A%2F%2Fanouslescaribous.com%2Fwp-content%2Fuploads%2F2020%2F11%2Fadresse-bouffe-plateau-montreal.jpg&imgrefurl=https%3A%2F%2Fanouslescaribous.com%2Fbouffe-reconfortante-plateau-mont-royal%2F&docid=djjr5aOPt92IjM&tbnid=wmo6-FX7rooC4M&vet=12ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA..i&w=2048&h=1365&hcb=2&ved=2ahUKEwiRjubZ0u2HAxWOU0EAHZQbMs0QM3oECCIQAA'}
        ],
      }
    ];
  }
}

