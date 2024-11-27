import 'package:empireone_mart/app/engagement/rewards/bloc/rewards_bloc.dart';
import 'package:empireone_mart/app/engagement/rewards/rewards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child: BlocBuilder<RewardsBloc, RewardsState>(
        builder: (context, state) {
          if (state is RewardsInitial || state is RewardsLoading) {
            return Container(
              height: 200,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is RewardsLoaded) {
            return Column(
              children: state.rewards.map((reward) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0), // Adds a gap
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EngagementPortalIDPage(reward: reward),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey[300],
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
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(reward.name,
                                      style: const TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20),
                                    ),
                                     Text(
                                      'Quantity: ${reward.quantity}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.wallet_giftcard),
                                    Text(reward.points_equivalent.toString(), // Replace with reward.pointsEquivalent if dynamic
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          } else if (state is RewardsError) {
            return Center(child: Text('Failed to load rewards: '));
          }
          return Center(child: Text('Unknown state'));
        },
      ),
    );
  }
}
