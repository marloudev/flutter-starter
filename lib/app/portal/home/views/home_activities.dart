import 'package:empireone_mart/app/portal/home/views/_views.dart';
import 'package:flutter/material.dart';

class HomeActivities extends StatefulWidget {
  final List modules;
  const HomeActivities({super.key, required this.modules});

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
                'Modules',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.lightBlue,
                  fontFamily: 'JollyFont',
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Column(
            children: widget.modules.map((module) {
              print('modulesmodules,${module}');
              return HomeRewardList(
                  module: module); // Create a widget for each activity
            }).toList(), // Convert the iterable into a list
          ),
        ],
      ),
    );
  }
}
