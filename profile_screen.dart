import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String userName;
  final String displayPicture;
  final String dob;
  final String joinedDate;
  final String history;
  final String userType;
  final String address;

  const ProfileScreen({
    super.key,
    required this.userName,
    required this.displayPicture,
    required this.dob,
    required this.joinedDate,
    required this.history,
    required this.userType,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(displayPicture),
            ),
            const SizedBox(height: 16),
            Text('User Name: $userName', style: const TextStyle(fontSize: 16)),
            Text('Date of Birth: $dob', style: const TextStyle(fontSize: 16)),
            Text('Joined Date: $joinedDate', style: const TextStyle(fontSize: 16)),
            Text('History: $history', style: const TextStyle(fontSize: 16)),
            Text('User Type: $userType', style: const TextStyle(fontSize: 16)),
            Text('Address: $address', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}