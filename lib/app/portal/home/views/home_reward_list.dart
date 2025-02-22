import 'package:empireone_mart/app/portal/home/quest/quest.dart';
import 'package:empireone_mart/main.dart';
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
        BackgroundMusicPlayer.playTapSound();
        // context.go('/quest/${widget.module.id}');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Introductory(data: widget.module),
          ),
        );
      },
      child: Card(
        color: Color(0xFF89E4E1),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon Section#00acc1
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(
                      0xFF00acc1), // Change this to your desired background color
                ),
                padding: const EdgeInsets.all(
                    10), // Adjust padding to control the circle size
                child: const Icon(
                  Icons.menu_book_outlined,
                  size: 40.0,
                  color: Colors.white,
                ),
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
                        color: const Color.fromARGB(221, 56, 54, 54),
                        fontWeight: FontWeight.w800,
                        fontFamily: 'JollyFont',
                      ),
                      softWrap: true, // Ensures text wraps to the next line
                      overflow: TextOverflow.clip, // Clip excess text if needed
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              // Reward Card Section
              // Card(
              //   color: Colors.blue,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(15.0),
              //   ),
              //   elevation: 5,
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(
              //       vertical: 5,
              //       horizontal: 15,
              //     ),
              //     child: Text(
              //       widget.module.grade ?? '',
              //       style: const TextStyle(
              //         fontSize: 16,
              //         color: Colors.white,
              //         fontWeight: FontWeight.w700,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
