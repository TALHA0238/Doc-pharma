// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class PharmaciesScreen extends StatelessWidget {
  const PharmaciesScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: const Text('Pharmacies'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          _buildSuggestedPharmacies(),
        ],
      ),
    );
  }

  Widget _buildSuggestedPharmacies() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildPharmacyCard('Dwatson Pharmacy'),
        _buildPharmacyCard('Shaheen Pharmacy'),
        _buildPharmacyCard('Hamza Pharmacy'),
      ],
    );
  }

  Widget _buildPharmacyCard(String pharmacyName) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: ListTile(
        title: Text(pharmacyName),
        onTap: () {
          // Implement the action when a pharmacy is tapped
        },
      ),
    );
  }
}
