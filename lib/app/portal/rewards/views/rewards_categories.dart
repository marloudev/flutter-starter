import 'package:empireone_mart/app/portal/rewards/views/reward_category_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RewardsCategories extends StatefulWidget {
  const RewardsCategories({super.key});

  @override
  State<RewardsCategories> createState() => _RewardsCategoriesState();
}

class _RewardsCategoriesState extends State<RewardsCategories> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'CATEGORIES',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.blue),
              ),
              Text(
                'View All',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w800,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                RewardCategoryList(
                    image: 'assets/images/categories/beauty.png',
                    label: 'FOODS'),
                RewardCategoryList(
                    image: 'assets/images/categories/fashion.png',
                    label: 'FASHION'),
                RewardCategoryList(
                    image: 'assets/images/categories/beauty.png',
                    label: 'BEAUTY'),
                RewardCategoryList(
                    image: 'assets/images/categories/grocery.png',
                    label: 'GROCERY'),
                RewardCategoryList(
                    image: 'assets/images/categories/gc.png', label: 'Gift Check'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
