import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> destinations = [
    {
      'name': 'Bali, Indonesia',
      'image': 'assets/bali.jpg',
      'desc': 'Tropical paradise with beautiful beaches',
    },
    {
      'name': 'Paris, France',
      'image': 'assets/paris.jpg',
      'desc': 'The city of love and lights',
    },
    {
      'name': 'Tokyo, Japan',
      'image': 'assets/tokyo.jpg',
      'desc': 'Vibrant city with rich culture',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Featured Destinations')),
      body: ListView.builder(
        itemCount: destinations.length,
        itemBuilder: (ctx, i) => _DestinationCard(destinations[i]),
      ),
    );
  }
}

class _DestinationCard extends StatelessWidget {
  final Map<String, String> data;

  const _DestinationCard(this.data);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Image.asset(data['image']!, height: 180, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['name']!,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  data['desc']!,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Explore', style: TextStyle(color: Colors.blue)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}