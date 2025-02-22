import 'package:empireone_mart/app/portal/quarter/views/_views.dart';
import 'package:empireone_mart/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuarterPage extends StatefulWidget {
  const QuarterPage({super.key});

  @override
  State<QuarterPage> createState() => _QuarterPageState();
}

class _QuarterPageState extends State<QuarterPage> {
  @override
  void initState() {
    super.initState();
    _checkToken(); // Call the token check in initState
  }

  Future<void> _checkToken() async {
    final _userResponse = await UserRepository().get_user();
    print('User Response: $_userResponse');
    if (_userResponse != 'success') {
      if (mounted) {
        context.go('/'); // Navigate only if the widget is still mounted
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background GIF
          Positioned.fill(
            child: Image.asset(
              "assets/gif/bg.gif",
              fit: BoxFit.cover,
            ),
          ),
          // Content on top of background
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: QuarterCard(title: '1st Quarter'),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: QuarterCard(title: '2nd Quarter'),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: QuarterCard(title: '3rd Quarter'),
                ),
                QuarterCard(title: '4th Quarter'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
