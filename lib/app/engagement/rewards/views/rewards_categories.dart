import 'package:empireone_mart/app/engagement/views/_views.dart';
import 'package:flutter/material.dart';

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
            child: SizedBox(
              child: Row(
                children: [
                  RewardsCategoryListSection(
                      image: 'assets/images/categories/food.png',
                      label: 'FOODS'),
                  RewardsCategoryListSection(
                      image: 'assets/images/categories/fashion.png',
                      label: 'FASHION'),
                  RewardsCategoryListSection(
                      image: 'assets/images/categories/beauty.png',
                      label: 'BEAUTY'),
                  RewardsCategoryListSection(
                      image: 'assets/images/categories/grocery.png',
                      label: 'GROCERY'),
                  RewardsCategoryListSection(
                      image: 'assets/images/categories/gc.png',
                      label: 'Gift Check'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
