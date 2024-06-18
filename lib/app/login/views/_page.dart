import 'package:empireone_mart/app/login/views/_view.dart';
import 'package:flutter/material.dart';

class LoginViewPage extends StatefulWidget {
  const LoginViewPage({super.key});

  @override
  State<LoginViewPage> createState() => _LoginViewPageState();
}

class _LoginViewPageState extends State<LoginViewPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginLogo(),
                SizedBox(
                  height: 15,
                ),
                LoginForm()
              ],
            )),
      ),
    );
  }
}
