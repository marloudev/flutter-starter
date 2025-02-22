import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Topbar extends StatefulWidget {
  const Topbar({super.key});

  @override
  State<Topbar> createState() => _TopbarState();
}

class _TopbarState extends State<Topbar> {
  String name = 'Loading...'; // Default value until the name is fetched

  // Function to get the name from SharedPreferences
  void get_name() async {
    final prefs = await SharedPreferences.getInstance();
    final storedName = prefs.getString('name') ??
        'Guest'; // Default to 'Guest' if no name is found
    setState(() {
      name = storedName; // Update the state with the fetched name
    });
  }

  @override
  void initState() {
    super.initState();
    get_name(); // Fetch the name when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name.isNotEmpty
                  ? '${name[0].toUpperCase()}${name.substring(1)}'
                  : '',
              style: const TextStyle(
                fontSize: 25,
                fontFamily: 'JollyFont',
                color: Colors.blue,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
