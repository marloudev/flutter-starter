import 'package:empireone_mart/app/portal/home/home.dart';
import 'package:empireone_mart/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuarterCard extends StatefulWidget {
  String title;
  QuarterCard({super.key, required this.title});

  @override
  State<QuarterCard> createState() => _QuarterCardState();
}

class _QuarterCardState extends State<QuarterCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            BackgroundMusicPlayer.playTapSound();
            context.go('/home/${widget.title}');
          },
          child: Center(
              child: Opacity(
            opacity: 0.9,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.lightBlue,
                      Colors.blue,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 330,
                height: 100,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${widget.title}'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 34,
                        fontFamily: 'JollyFont',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
        ),
      ],
    );
  }
}
