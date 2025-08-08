import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> pages = [
    {
      'title': 'Discover Places',
      'image': 'assets/intro1.jpg',
      'desc': 'Find the best travel destinations',
    },
    {
      'title': 'Plan Your Trip',
      'image': 'assets/intro2.jpg',
      'desc': 'Customize your travel itinerary',
    },
    {
      'title': 'Start Exploring',
      'image': 'assets/intro3.jpg',
      'desc': 'Begin your adventure today!',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: pages.length,
            itemBuilder: (ctx, i) => _IntroPage(pages[i]),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: () => _navigateToMainApp(context),
              child: const Text('SKIP', style: TextStyle(color: Colors.blue)),
            ),
          ),
          Positioned(
            bottom: 40,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                if (_currentPage < pages.length - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                } else {
                  _navigateToMainApp(context);
                }
              },
              child: const Icon(Icons.arrow_forward),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index ? Colors.blue : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToMainApp(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => MainNavigationWrapper()),
    );
  }
}

class _IntroPage extends StatelessWidget {
  final Map<String, String> pageData;

  const _IntroPage(this.pageData);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(pageData['image']!, height: 300),
          const SizedBox(height: 30),
          Text(
            pageData['title']!,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            pageData['desc']!,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}