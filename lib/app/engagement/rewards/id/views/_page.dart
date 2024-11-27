import 'package:empireone_mart/app/engagement/rewards/id/views/_views.dart';
import 'package:flutter/material.dart';

class EngagementPortalIDPage extends StatefulWidget {
  final dynamic reward;  // Add a reward field to accept data passed from previous screen

  // Modify the constructor to accept the reward data
  const EngagementPortalIDPage({super.key, required this.reward});

  @override
  State<EngagementPortalIDPage> createState() => _EngagementPortalIDPageState();
}

class _EngagementPortalIDPageState extends State<EngagementPortalIDPage> {
  @override
  Widget build(BuildContext context) {
    final reward = widget.reward;  // Access the reward data
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reward Information',  // Use the reward's data (e.g., name) in the title
          style: const TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.blue,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: RewardsIdSection(reward:reward),
        ),
      ),
    );
  }
}
