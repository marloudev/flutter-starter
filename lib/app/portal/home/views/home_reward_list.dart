import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeRewardList extends StatefulWidget {
  final module;
  const HomeRewardList({super.key, required this.module});

  @override
  State<HomeRewardList> createState() => _HomeRewardListState();
}

class _HomeRewardListState extends State<HomeRewardList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go('/quest/${widget.module.id}');
      },
      child: Card(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon Section
              Icon(
                Icons.emoji_events,
                size: 40.0,
                color: Colors.amber,
              ),
              const SizedBox(width: 10),
              // Text Content Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.module.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.blue[700],
                      ),
                      softWrap: true, // Ensures text wraps to the next line
                      overflow: TextOverflow.clip, // Clip excess text if needed
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              // Reward Card Section
              Card(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 15,
                  ),
                  child: Text(
                    widget.module.grade ?? '',
                    style: const TextStyle(
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
      ),
    );
  }
}
