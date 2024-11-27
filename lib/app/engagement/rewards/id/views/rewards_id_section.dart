import 'package:flutter/material.dart';

class RewardsIdSection extends StatefulWidget {
  final dynamic reward;  // Add a reward field to accept data passed from previous screen
  const RewardsIdSection({super.key, required this.reward});

  @override
  State<RewardsIdSection> createState() => _RewardsIdSectionState();
}

class _RewardsIdSectionState extends State<RewardsIdSection> {
  @override
  Widget build(BuildContext context) {
    final reward = widget.reward;  // Access the reward data
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: Image.asset('assets/images/logo.png'),
        ),
        const SizedBox(
          height: 10,
        ),
         Text(reward.name,
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w900,
            fontSize: 20
          ),
        ),
         const SizedBox(
          height: 20,
        ),
         Text(reward.description),
      ],
    );
  }
}
