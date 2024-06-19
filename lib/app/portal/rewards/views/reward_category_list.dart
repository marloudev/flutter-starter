import 'package:flutter/material.dart';

class RewardCategoryList extends StatefulWidget {
  final String image;
  final String label;
  const RewardCategoryList(
      {super.key, required this.image, required this.label});

  @override
  State<RewardCategoryList> createState() => _RewardCategoryListState();
}

class _RewardCategoryListState extends State<RewardCategoryList> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      child: Container(
        height: 100,
        width: 80,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset(
                widget.image,
              ),
              Text(
                widget.label,
                style: TextStyle(fontSize: 11,
                fontWeight: FontWeight.w600
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
