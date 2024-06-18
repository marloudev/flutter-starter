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
        Image.asset('assets/images/logo.png'),
        const Text(
          'MART',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 50,
            fontWeight: FontWeight.w800,
          ),
        )
      ],
    );
  }
}
