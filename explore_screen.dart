import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'name': 'Beaches', 'icon': 'assets/beach.png'},
    {'name': 'Mountains', 'icon': 'assets/mountain.png'},
    {'name': 'City Tours', 'icon': 'assets/city.png'},
    {'name': 'Historical', 'icon': 'assets/historical.png'},
    {'name': 'Adventure', 'icon': 'assets/adventure.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explore Categories')),
      body: SingleChildScrollView(
        child: Column(
          children: categories.map((category) => _CategoryTile(category)).toList(),
        ),
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  final Map<String, String> data;

  const _CategoryTile(this.data);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(data['icon']!, width: 40),
      title: Text(
        data['name']!,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () {},
    );
  }
}