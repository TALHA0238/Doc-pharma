// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class DiapredictScreen extends StatefulWidget {
  const DiapredictScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DiapredictScreenState createState() => _DiapredictScreenState();
}

class _DiapredictScreenState extends State<DiapredictScreen> {
  // Variables to hold user inputs
  int? age;
  double? glucose;
  double? bmi;
  bool parentWithDiabetes = false;
  bool siblingWithDiabetes = false;
  bool multipleFamilyMembersWithDiabetes = false;

  String? predictionResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diapredict'),
      ),
      backgroundColor: Colors.blue[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) => age = int.tryParse(value),
              decoration: const InputDecoration(labelText: 'Age'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) => glucose = double.tryParse(value),
              decoration: const InputDecoration(labelText: 'Glucose Level'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) => bmi = double.tryParse(value),
              decoration: const InputDecoration(labelText: 'BMI'),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Parent with Type 2 Diabetes:'),
                Switch(
                  value: parentWithDiabetes,
                  onChanged: (value) => setState(() => parentWithDiabetes = value),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Sibling with Type 1 Diabetes:'),
                Switch(
                  value: siblingWithDiabetes,
                  onChanged: (value) => setState(() => siblingWithDiabetes = value),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Multiple Family Members with Diabetes:'),
                Switch(
                  value: multipleFamilyMembersWithDiabetes,
                  onChanged: (value) => setState(() => multipleFamilyMembersWithDiabetes = value),
                ),
              ],
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: _predictDiabetes,
              child: const Text('Predict'),
            ),
            const SizedBox(height: 16.0),
            if (predictionResult != null)
              Text(
                'Prediction: $predictionResult',
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }

  void _predictDiabetes() {
    if (age != null && glucose != null && bmi != null) {
      bool isDiabetic = false;

      // Simple prediction logic
      if (age! > 30 && glucose! > 120) {
        isDiabetic = true;
      }

      // Adjust based on BMI
      if (bmi! > 25) {
        isDiabetic = true;
      }

      // Adjust prediction based on family history
      if (parentWithDiabetes || siblingWithDiabetes || multipleFamilyMembersWithDiabetes) {
        isDiabetic = true;
      }

      setState(() {
        predictionResult = isDiabetic ? 'Possibly Diabetic' : 'Not Diabetic';
      });
    } else {
      setState(() {
        predictionResult = 'Please fill in all details';
      });
    }
  }
}
