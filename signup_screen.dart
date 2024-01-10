// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  String? firstName;
  String? lastName;
  String? email;
  String? phoneNo;
  String? gender;
  String? password;
  String? confirmPassword;
  String? category;

  final _phoneNumberRegExp = RegExp(r'^(92|03)\d{9}$'); // Updated regex pattern for phone number
  final _emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTextField('First Name', (value) => firstName = value),
              const SizedBox(height: 16),
              _buildTextField('Last Name', (value) => lastName = value),
              const SizedBox(height: 16),
              _buildTextField('Email', (value) => email = value, keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 16),
              _buildTextField('Phone No', (value) => phoneNo = value, keyboardType: TextInputType.phone),
              const SizedBox(height: 16),
              _buildCategoryDropdown(),
              const SizedBox(height: 16),
              _buildTextField('Gender', (value) => gender = value),
              const SizedBox(height: 16),
              _buildTextField('Password', (value) => password = value, isPassword: true),
              const SizedBox(height: 16),
              _buildTextField('Confirm Password', (value) => confirmPassword = value, isPassword: true),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _validateAndSignUp,
                child: const Text('Confirm Signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, Function(String?) onSaved, {bool isPassword = false, TextInputType? keyboardType}) {
    return TextFormField(
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$label is required';
        }
        
        if (label == 'Phone No' && !_phoneNumberRegExp.hasMatch(value)) {
          return 'Invalid phone number';
        }

        if (label == 'Email' && !_emailRegExp.hasMatch(value)) {
          return 'Invalid email format';
        }

        if (label == 'Password' && (value.length < 8 || !value.contains(RegExp(r'[A-Z]')))) {
          return 'Password must be at least 8 characters long and contain at least one uppercase letter';
        }

        return null;
      },
      onSaved: onSaved,
    );
  }

  Widget _buildCategoryDropdown() {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: 'Category',
        border: OutlineInputBorder(),
      ),
      items: ['Doctor', 'Patient', 'Pharmacy']
          .map((category) => DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          category = value;
        });
      },
      validator: (value) {
        if (value == null) {
          return 'Please select a category';
        }
        return null;
      },
    );
  }

  void _validateAndSignUp() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Passwords do not match')));
        return;
      }

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }
}
