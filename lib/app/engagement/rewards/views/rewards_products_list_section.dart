import 'package:empireone_mart/app/engagement/rewards/rewards.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RewardsProductsListSection extends StatefulWidget {
  const RewardsProductsListSection({super.key});

  @override
  State<RewardsProductsListSection> createState() =>
      _RewardsProductsListSectionState();
}

class _RewardsProductsListSectionState
    extends State<RewardsProductsListSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EngagementPortalIDPage()),
          );
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.grey[300],
          // foregroundColor: Colors.white,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/categories/beauty.png',
              height: 140,
              width: double.infinity,
            ),
            const Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'MCDO MIX & MATCH',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w800,
                            fontSize: 20),
                      ),
                      Text(
                        'Foods',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.wallet_giftcard),
                      Text(
                        '500pts',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
