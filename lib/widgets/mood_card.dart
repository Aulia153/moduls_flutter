import 'package:flutter/material.dart';

class MoodCard extends StatelessWidget{
  final String mood;
  final String description;

  const MoodCard({super.key, required this.mood, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: const Icon(Icons.mood, color: Colors.blue),
        title: Text(mood, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
      ),
    );
  }
}