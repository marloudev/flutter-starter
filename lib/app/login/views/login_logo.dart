import 'package:flutter/material.dart';

class LoginLogo extends StatefulWidget {
  const LoginLogo({super.key});

  @override
  State<LoginLogo> createState() => _LoginLogoState();
}

class _LoginLogoState extends State<LoginLogo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/logo.jpg',
          width: 100,
        ),
        const Text(
          'Science Quest',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
