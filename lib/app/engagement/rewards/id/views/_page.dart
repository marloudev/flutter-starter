import 'package:empireone_mart/app/engagement/rewards/id/views/_views.dart';
import 'package:flutter/material.dart';

class EngagementPortalIDPage extends StatefulWidget {
  const EngagementPortalIDPage({super.key});

  @override
  State<EngagementPortalIDPage> createState() => _EngagementPortalIDPageState();
}

class _EngagementPortalIDPageState extends State<EngagementPortalIDPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GIFT CHECK',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.blue,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: RewardsIdSection(),
        ),
      ),
    );
  }
}
