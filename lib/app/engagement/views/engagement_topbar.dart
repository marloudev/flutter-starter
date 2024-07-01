import 'package:flutter/material.dart';

class EngagementTopbar extends StatefulWidget {
  const EngagementTopbar({super.key});

  @override
  State<EngagementTopbar> createState() => _EngagementTopbarState();
}

class _EngagementTopbarState extends State<EngagementTopbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment
          .spaceBetween, // Align Row contents to the start (left)
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment
              .start, // Align Column contents to the start (left)
          children: [
            Text(
              'HI ALLEN!',
              style: TextStyle(
                fontSize: 25,
                color: Colors.blue,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              'Embrace Rewards, seize success!',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(
            width: 10), // Optional: Add some spacing between Column and Image
        Image.asset(
          'assets/images/profile.png',
          width: 50,
        ),
      ],
    );
  }
}
