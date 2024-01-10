// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

// ignore: unused_import
import 'home_screen.dart';
import 'doctorScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? selectedCategory;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTextField('Email or Phone', controller: _emailController),
            const SizedBox(height: 16),
            _buildTextField('Password', isPassword: true, controller: _passwordController),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
            const SizedBox(height: 16),
            _buildCategoryButton(context),
            const SizedBox(height: 16),
            selectedCategory != null
                ? Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('Selected Category: $selectedCategory'),
                  )
                : const SizedBox.shrink(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.facebook),
                  onPressed: () {
                    // Implement Facebook login functionality
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.mail),
                  onPressed: () {
                    // Implement Google login functionality
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {bool isPassword = false, TextEditingController? controller}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _showCategoryDialog(context);
      },
      child: const Text('Select Category'),
    );
  }

  Future<void> _showCategoryDialog(BuildContext context) async {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildCategoryOption(context, 'Doctor'),
                _buildCategoryOption(context, 'Patient'),
                _buildCategoryOption(context, 'Pharmacy'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCategoryOption(BuildContext context, String category) {
    return ListTile(
      title: Text(category),
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
        Navigator.pop(context); // Close the dialog
      },
    );
  }

  void _login() {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    // Hardcoded login check (Replace with actual logic)
    if (email == 'test@email.com' && password == 'password123') {
      if (selectedCategory == 'Doctor') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DoctorScreen()),  // Redirect to DoctorScreen
        );
      } else if (selectedCategory == 'Patient') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),  // Redirect to HomeScreen
        );
      } else {
        // Handle other categories or default behavior
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid email or password'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}