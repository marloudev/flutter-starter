import 'package:empireone_mart/app/engagement/rewards/bloc/rewards_bloc.dart';
import 'package:empireone_mart/app/engagement/rewards/views/_view.dart';
import 'package:empireone_mart/repository/rewards_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RewardsProductsSection extends StatefulWidget {
  const RewardsProductsSection({super.key});

  @override
  State<RewardsProductsSection> createState() => _RewardsProductsSectionState();
}

class _RewardsProductsSectionState extends State<RewardsProductsSection> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RewardsBloc(
        RewardsRepository(),
      )..add(
          fetchRewards(),
        ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Row(
            children: [
              Text(
                'Rewards',
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
            ],
          )
        ],
      ),
    );
  }
}
