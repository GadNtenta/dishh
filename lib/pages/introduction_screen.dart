import 'package:flutter/material.dart';

import 'Home_Screen.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    return List<Widget>.generate(3, (int index) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        height: 8.0,
        width: _currentPage == index ? 24.0 : 16.0,
        decoration: BoxDecoration(
          color: _currentPage == index ? Colors.blue : Colors.grey,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: <Widget>[
              _buildPageContent(
                image: 'assets/images/burger.jpeg',
                title: 'Bienvenue',
                body: 'Description de la première page.',
              ),
              _buildPageContent(
                image: 'assets/image2.png',
                title: 'Caractéristique',
                body: 'Description de la deuxième page.',
              ),
              _buildPageContent(
                image: 'assets/image3.png',
                title: 'Commencer',
                body: 'Description de la troisième page.',
              ),
            ],
          ),
          Positioned(
            bottom: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
          ),
          Positioned(
            right: 20.0,
            bottom: 50.0,
            child: _currentPage != 2
                ? FloatingActionButton(
              onPressed: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              child: const Icon(Icons.arrow_forward),
            )
                : FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: const Icon(Icons.done),
            ),
          ),
          Positioned(
            left: 20.0,
            bottom: 50.0,
            child: _currentPage != 2
                ? TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: const Text(
                "Sauter",
                style: TextStyle(color: Colors.blue, fontSize: 18.0),
              ),
            )
                : Container(),
          ),
        ],
      ),
    );
  }

  Widget _buildPageContent({required String image, required String title, required String body}) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            image,
            height: 300.0,
            width: 300.0,
          ),
          const SizedBox(height: 30.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15.0),
          Text(
            body,
            style: const TextStyle(
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
