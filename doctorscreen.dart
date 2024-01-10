// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'DoctorScreen Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DoctorScreen(),
    ),
  );
}

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: const Text('Doctor Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildDoctorInfoBox(),
          _buildNewsBox(),
          _buildPatientRecordBox(),
          Expanded(
            child: Row(
              children: [
                Expanded(child: _buildBox('Consultation')),
                Expanded(child: _buildBox('Diapredict')),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: _buildBox('News')),
                Expanded(child: _buildBox('Record')),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.blue[200],
          primaryColor: Colors.black,
          textTheme: Theme.of(context).textTheme.copyWith(
                bodySmall: TextStyle(color: Colors.grey[500]),
              ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital),
              label: 'Pharmacies',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBox(String title) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildDoctorInfoBox() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      margin: const EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 45,
            backgroundImage: AssetImage('images/ii.jpg'),
          ),
          SizedBox(width: 12.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr. Nouman',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'MBBS, MD',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                'Experience: 10 years',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                'Specialization: Diabetes T1',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNewsBox() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: const Row(
        children: [
          Icon(Icons.new_releases, size: 36, color: Colors.blue),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Latest News Headline 1',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 6.0),
                Text(
                  'Short description of the news headline. This is just a sample text.',
                  style: TextStyle(fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPatientRecordBox() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person, size: 36, color: Colors.blue),
              SizedBox(width: 12.0),
              Text(
                'Patient Records',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 12.0),
          Text(
            'Consultation Record 1: Patient was advised to take rest.',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 6.0),
          Text(
            'Consultation Record 2: Prescribed medicine for flu symptoms.',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 6.0),
          Text(
            'Consultation Record 3: Recommended regular check-ups for better health.',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
