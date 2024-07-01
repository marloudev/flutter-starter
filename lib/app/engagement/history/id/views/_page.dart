import 'package:flutter/material.dart';

class EngagementHistoryIDPage extends StatefulWidget {
  const EngagementHistoryIDPage({super.key});

  @override
  State<EngagementHistoryIDPage> createState() => _EngagementHistoryIDPageState();
}

class _EngagementHistoryIDPageState extends State<EngagementHistoryIDPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      //  actions: [
      //   Text('data')
      //  ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: const Text('history details page'),
      ),
    );
  }
}