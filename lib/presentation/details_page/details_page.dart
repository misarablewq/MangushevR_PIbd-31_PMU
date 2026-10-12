import 'package:flutter/material.dart';

import '../../domain/models/card_data.dart';

class DetailsPage extends StatelessWidget {
  final CardData data;

  const DetailsPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.text),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              data.imagePath,
              height: 260,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            data.text,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            data.price,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            data.descriptionText,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
