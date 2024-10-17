import 'package:empireone_mart/app/engagement/home/home.dart';
import 'package:empireone_mart/app/engagement/home/model/home_model.dart';
import 'package:flutter/material.dart';

class HomeActivities extends StatefulWidget {
  final List activities;
  const HomeActivities({super.key, required this.activities});

  @override
  State<HomeActivities> createState() => _HomeActivitiesState();
}

class _HomeActivitiesState extends State<HomeActivities> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 15, 5, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                'Recent Activity',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.blue[700],
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Column(
            children: widget.activities.map((activity) {
              return HomeRewardList(); // Create a widget for each activity
            }).toList(), // Convert the iterable into a list
          ),
        ],
      ),
    );
  }
}
