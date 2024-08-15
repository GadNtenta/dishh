import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:universal_io/io.dart';
import 'Pc/Restaurants/add_restaurant.dart';
import 'pages/introduction_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Introduction Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _getHomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget _getHomeScreen() {
    if (Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
      return const AddRestaurant();
    } else {
      return const IntroductionScreen();
    }
  }
}
