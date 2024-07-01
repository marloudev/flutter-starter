import 'package:empireone_mart/app/engagement/rewards/views/_view.dart';
import 'package:flutter/material.dart';

class RewardsProductsSection extends StatefulWidget {
  const RewardsProductsSection({super.key});

  @override
  State<RewardsProductsSection> createState() => _RewardsProductsSectionState();
}

class _RewardsProductsSectionState extends State<RewardsProductsSection> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Row(
          children: [
            Text(
              'Products',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.w800),
            )
          ],
        ),
        Column(
          children: [
            RewardsProductsListSection(),
            RewardsProductsListSection(),
            RewardsProductsListSection(),
          ],
        )
        ],
    );
  }
}
