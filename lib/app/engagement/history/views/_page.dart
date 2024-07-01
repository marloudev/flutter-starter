import 'package:empireone_mart/app/engagement/history/views/_views.dart';
import 'package:flutter/material.dart';

class HistoryViewPage extends StatefulWidget {
  const HistoryViewPage({super.key});

  @override
  State<HistoryViewPage> createState() => _HistoryViewPageState();
}

class _HistoryViewPageState extends State<HistoryViewPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          EngagementHistoryList(),
          EngagementHistoryList(),
          EngagementHistoryList(),
          EngagementHistoryList(),
          EngagementHistoryList(),
          EngagementHistoryList(),
          EngagementHistoryList(),
          EngagementHistoryList(),
          EngagementHistoryList(),
          EngagementHistoryList(),
          EngagementHistoryList(),
          EngagementHistoryList(),
        ],
      ),
    );
  }
}
