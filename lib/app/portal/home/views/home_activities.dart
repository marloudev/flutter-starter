import 'package:empireone_mart/app/portal/home/home.dart';
import 'package:flutter/material.dart';

class HomeActivities extends StatefulWidget {
  const HomeActivities({super.key});

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
            mainAxisSize: MainAxisSize.min,
            children: [
              HomeRewardList(),
              HomeRewardList(),
              HomeRewardList(),
              HomeRewardList(),
              HomeRewardList(),
              HomeRewardList(),
            ],
          ),
        ],
      ),
    );
  }
}
