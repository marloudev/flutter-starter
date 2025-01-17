import 'package:empireone_mart/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:localstorage/localstorage.dart'; // Add this import

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _employeeIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String notify = ''; // For showing success/failure messages
  bool _isLoading = false; // For loading state
  final _formKey = GlobalKey<FormState>();

  // Method to login user
  void loginUser(BuildContext context) async {
    // Start loading
    setState(() {
      _isLoading = true;
      notify = '';
    });

    // Perform login request
    final response = await AuthRepository().authLogin(
      _employeeIdController.text,
      _passwordController.text,
    );

    // Update UI with response
    setState(() {
      _isLoading = false; // Stop loading
      if (response['status'] == 'success') {
        notify = '';
        _storeToken(response['data']['token']); // Store token in local storage
        context.go('/portal');
      } else {
        notify = 'Login failed. Please check your credentials.';
      }
    });
  }

  // Method to store the token in local storage
  void _storeToken(String token) async {
    localStorage.setItem('token', token);
  }

  // Method to get the token from local storage
  Future<String?> _getToken() async {
    // return await localStorage.getItem('token'); // Retrieve token
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              notify,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _employeeIdController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Employee ID',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Employee ID';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                onPressed: _isLoading
                    ? null // Disable button while loading
                    : () {
                        if (_formKey.currentState!.validate()) {
                          loginUser(context); // Perform login
                        }
                      },
                child: _isLoading
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ) // Show loading spinner
                    : const Text('LOGIN'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _employeeIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
