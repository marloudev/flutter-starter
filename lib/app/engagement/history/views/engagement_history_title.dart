import 'package:flutter/material.dart';

class EngagementHistoryTitle extends StatefulWidget {
  const EngagementHistoryTitle({super.key});

  @override
  State<EngagementHistoryTitle> createState() => _EngagementHistoryTitleState();
}

class _EngagementHistoryTitleState extends State<EngagementHistoryTitle> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Claim History',
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
