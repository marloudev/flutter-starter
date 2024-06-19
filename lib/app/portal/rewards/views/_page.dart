import 'package:empireone_mart/app/login/views/sample.dart';
import 'package:empireone_mart/app/portal/views/_views.dart';
import 'package:flutter/material.dart';

class RewardPage extends StatefulWidget {
  const RewardPage({super.key});

  @override
  State<RewardPage> createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              SearchProducts(),
              SizedBox(
                height: 12,
              ),
              RewardsCategories(),
              Sample()
            ],
          ),
        )
      ],
    );
  }
}
