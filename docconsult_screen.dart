import 'package:flutter/material.dart';

class DocconsultScreen extends StatelessWidget {
  const DocconsultScreen({super.key}); // Added super call

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: const Text('Docconsult'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor Profile Section
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage('images/hh.jpg'),
              ),
              title: const Text('Dr. waleed'),
              subtitle: const Text('Specialization: Cardiology'),
              trailing: IconButton(
                icon: const Icon(Icons.info),
                onPressed: () {
                  // Navigate to the detailed profile screen or show a modal
                },
              ),
            ),
            const SizedBox(height: 16.0),

            // Doctor's Previous Consultation History
            const Text(
              'Previous Consultations',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),

            // Sample Previous Consultations
            ListTile(
              title: const Text('Chat Consultation'),
              subtitle: const Text('Date: 20 Dec 2023'),
              onTap: () {
                // Navigate to the chat screen for this consultation
              },
            ),
            ListTile(
              title: const Text('Voice Call Consultation'),
              subtitle: const Text('Date: 18 Dec 2023'),
              onTap: () {
                // Initiate voice call for this consultation
              },
            ),
            ListTile(
              title: const Text('Video Call Consultation'),
              subtitle: const Text('Date: 15 Dec 2023'),
              onTap: () {
                // Initiate video call for this consultation
              },
            ),

            // Phone Icon Positioned at the Bottom
            const SizedBox(height: 16.0),
            // Removed Positioned widget as it's not used correctly here
            Center(
              child: IconButton(
                icon: const Icon(Icons.phone),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: const Icon(Icons.video_call),
                            title: const Text('Video Call'),
                            onTap: () {
                              // Initiate video call
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.chat),
                            title: const Text('Chat'),
                            onTap: () {
                              // Navigate to chat functionality
                            },
                          ),
                          // Adding other options
                          ListTile(
                            leading: const Icon(Icons.email),
                            title: const Text('Email'),
                            onTap: () {
                              // Send an email
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.calendar_today),
                            title: const Text('Schedule'),
                            onTap: () {
                              // Schedule an appointment
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.message),
                            title: const Text('Send Message'),
                            onTap: () {
                              // Send a message
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
