// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  _RecordScreenState createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  List<String> userRecords = ['User Record 1', 'User Record 2', 'User Record 3'];
  List<String> doctorRecords = ['Dr. A Consultation', 'Dr. B Consultation'];
  List<String> reports = ['MRI Report', 'Blood Test Report', 'X-ray Report'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200], // Keeping the background consistent
      appBar: AppBar(
        title: const Text('Record'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                _addReportOrFile(context);
              },
              icon: const Icon(Icons.file_upload),
              label: const Text('Add Report/File'),
            ),
            const SizedBox(height: 32.0),
            const Text(
              'User Records:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: userRecords.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(userRecords[index]),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Doctor Consultation Records:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: doctorRecords.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(doctorRecords[index]),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Reports/Files:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: reports.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(reports[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addReportOrFile(BuildContext context) {
    final timestamp = DateTime.now().toString();
    setState(() {
      reports.add('Report/File Uploaded at $timestamp');
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Uploaded Report/File at $timestamp')),
    );
  }
}
