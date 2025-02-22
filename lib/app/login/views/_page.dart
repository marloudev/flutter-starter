import 'package:empireone_mart/app/login/views/_view.dart';
import 'package:empireone_mart/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginViewPage extends StatefulWidget {
  const LoginViewPage({super.key});

  @override
  State<LoginViewPage> createState() => _LoginViewPageState();
}

class _LoginViewPageState extends State<LoginViewPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getToken();
  }

  void _getToken() async {
    setState(() {
      _isLoading = true;
    });

    final _userResponse = await UserRepository().get_user();

    if (_userResponse == 'success') {
      print('User authenticated: $_userResponse');
      context.go('/portal');
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: _isLoading
              ? CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginLogo(),
                    SizedBox(height: 15),
                    LoginForm(),
                  ],
                ),
        ),
      ),
    );
  }
}
