import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        Text(
          'Diabetes Type 1 Health Plans',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        ExerciseTile(Icons.directions_walk, 'Walking', '30 mins per day'),
        ExerciseTile(Icons.directions_run, 'Running', '20 mins per day'),
        ExerciseTile(Icons.fitness_center, 'Gym', '45 mins per session'),
        ExerciseTile(Icons.pool, 'Swimming', '40 mins per session'),
      ],
    );
  }
}

class ExerciseTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ExerciseTile(this.icon, this.title, this.description, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(description),
    );
  }
}
