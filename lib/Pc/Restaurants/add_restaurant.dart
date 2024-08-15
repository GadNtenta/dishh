import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class AddRestaurant extends StatefulWidget {
  const AddRestaurant({super.key});

  @override
  _AddRestaurantState createState() => _AddRestaurantState();
}

class _AddRestaurantState extends State<AddRestaurant> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController cuisineController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController hoursController = TextEditingController();
  List<MenuItem> menuItems = [];

  File? _restaurantImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Restaurant'),
        backgroundColor: Colors.teal,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/restaurant_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Card(
                    color: Colors.white70,
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          buildTextFormField(
                            controller: cuisineController,
                            label: 'Cuisine',
                            icon: Icons.restaurant_menu,
                          ),
                          buildImagePickerField(),
                          buildTextFormField(
                            controller: nameController,
                            label: 'Name',
                            icon: Icons.restaurant,
                          ),
                          buildTextFormField(
                            controller: priceController,
                            label: 'Price',
                            icon: Icons.attach_money,
                          ),
                          buildTextFormField(
                            controller: ratingController,
                            label: 'Rating',
                            icon: Icons.star,
                          ),
                          buildTextFormField(
                            controller: timeController,
                            label: 'Time',
                            icon: Icons.timer,
                          ),
                          buildTextFormField(
                            controller: descriptionController,
                            label: 'Description',
                            icon: Icons.description,
                          ),
                          buildTextFormField(
                            controller: addressController,
                            label: 'Address',
                            icon: Icons.location_on,
                          ),
                          buildTextFormField(
                            controller: phoneController,
                            label: 'Phone',
                            icon: Icons.phone,
                          ),
                          buildTextFormField(
                            controller: hoursController,
                            label: 'Hours',
                            icon: Icons.access_time,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Menu Items',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: menuItems.length,
                            itemBuilder: (context, index) {
                              return buildMenuItemField(index);
                            },
                          ),
                          TextButton.icon(
                            onPressed: () {
                              setState(() {
                                menuItems.add(MenuItem());
                              });
                            },
                            icon: const Icon(Icons.add),
                            label: const Text('Add Menu Item'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  FloatingActionButton.extended(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        addRestaurant();
                      }
                    },
                    label: const Text('Add Restaurant'),
                    icon: const Icon(Icons.add),
                    backgroundColor: Colors.teal,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextFormField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the $label';
          }
          return null;
        },
      ),
    );
  }

  Widget buildImagePickerField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Restaurant Image',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: imageController,
                  decoration: const InputDecoration(
                    labelText: 'Image URL',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the image URL';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: const Icon(Icons.image),
                onPressed: () async {
                  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() {
                      _restaurantImage = File(pickedFile.path);
                    });
                  }
                },
              ),
            ],
          ),
          if (_restaurantImage != null)
            Image.file(
              _restaurantImage!,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
        ],
      ),
    );
  }

  Widget buildMenuItemField(int index) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Menu Item ${index + 1} Name',
                border: const OutlineInputBorder(),
              ),
              onChanged: (value) {
                menuItems[index].name = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the name of the menu item';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                menuItems[index].description = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the description of the menu item';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                menuItems[index].price = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the price of the menu item';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Image URL',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      menuItems[index].imageUrl = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the image URL of the menu item';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.image),
                  onPressed: () async {
                    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      setState(() {
                        menuItems[index].localImage = File(pickedFile.path);
                      });
                    }
                  },
                ),
              ],
            ),
            if (menuItems[index].localImage != null)
              Image.file(
                menuItems[index].localImage!,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
          ],
        ),
      ),
    );
  }

  void addRestaurant() {
    CollectionReference restaurants = FirebaseFirestore.instance.collection('restaurants');
    restaurants.add({
      'cuisine': cuisineController.text,
      'image': imageController.text,
      'name': nameController.text,
      'price': priceController.text,
      'rating': ratingController.text,
      'time': timeController.text,
      'description': descriptionController.text,
      'address': addressController.text,
      'phone': phoneController.text,
      'hours': hoursController.text,
      'menu': menuItems.map((menuItem) => {
        'name': menuItem.name,
        'description': menuItem.description,
        'price': menuItem.price,
        'image': menuItem.localImage != null ? menuItem.localImage!.path : menuItem.imageUrl,
      }).toList(),
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Restaurant Added')));
      clearForm();
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to add restaurant: $error')));
    });
  }

  void clearForm() {
    cuisineController.clear();
    imageController.clear();
    nameController.clear();
    priceController.clear();
    ratingController.clear();
    timeController.clear();
    descriptionController.clear();
    addressController.clear();
    phoneController.clear();
    hoursController.clear();
    menuItems.clear();
    setState(() {
      _restaurantImage = null;
    });
  }
}

class MenuItem {
  String? name;
  String? description;
  String? price;
  String? imageUrl;
  File? localImage;

  MenuItem({
    this.name,
    this.description,
    this.price,
    this.imageUrl,
    this.localImage,
  });
}
