import 'package:flutter/material.dart';

class PortalActivities extends StatefulWidget {
  const PortalActivities({super.key});

  @override
  State<PortalActivities> createState() => _PortalActivitiesState();
}

class _PortalActivitiesState extends State<PortalActivities> {
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
          const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Logo'),
                      Text('Early Bird Award'),
                      Text('Points'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Logo'),
                      Text('Best in Attire Award'),
                      Text('Points'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Logo'),
                      Text('Upsell Award'),
                      Text('Points'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
