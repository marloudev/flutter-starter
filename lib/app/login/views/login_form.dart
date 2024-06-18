import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: 'Employee ID'),
        ),
        const SizedBox(height: 15),
        const TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: 'Password'),
        ),
        const SizedBox(height: 15),
        Container(
          width: double.infinity,
          child: SizedBox(
            height: 40,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                onPressed: () {
                  context.go('/home');
                },
                child: const Text('LOGIN')),
          ),
        )
      ],
    );
  }
}
