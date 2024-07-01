import 'package:empireone_mart/app/engagement/history/id/views/_views.dart';
import 'package:flutter/material.dart';

class EngagementHistoryList extends StatefulWidget {
  const EngagementHistoryList({super.key});

  @override
  State<EngagementHistoryList> createState() => _EngagementHistoryListState();
}

class _EngagementHistoryListState extends State<EngagementHistoryList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey, // Border color
            width: 1.0, // Border width
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Claim ID'),
              Text(
                'Item Name',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text('Claimed Date'),
            ],
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EngagementHistoryIDPage(),
                ),
              );
            },
            child: const Row(
              children: [
                Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue,
                  size: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
