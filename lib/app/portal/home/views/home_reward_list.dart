import 'package:flutter/material.dart';

class HomeRewardList extends StatefulWidget {
  const HomeRewardList({super.key});

  @override
  State<HomeRewardList> createState() => _HomeRewardListState();
}

class _HomeRewardListState extends State<HomeRewardList> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.emoji_events,
              size: 40.0,
              color: Colors.amber,
            ),
            Column(
              children: [
                Text(
                  'Early Bird Award',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.blue[700]),
                ),
                Text('You earned 30 E-Points')
              ],
            ),
            Card(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  '+50',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
