import 'package:empireone_mart/app/portal/home/quest/quest.dart';
import 'package:empireone_mart/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Lesson extends StatefulWidget {
  final data;
  Lesson({super.key, required this.data});

  @override
  State<Lesson> createState() => _LessonState();
}

class _LessonState extends State<Lesson> {
  @override
  Widget build(BuildContext context) {
    final assessments = widget.data.lessons;
    int passedCount = assessments
        .where((assessment) => assessment["assessment_status"] == "Passed")
        .length;

    // print("Total Passed Assessments: $passedCount");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue,
            size: 40,
          ),
          onPressed: () {
            BackgroundMusicPlayer.playTapSound();
            context.pop(); // Navigate to the '/quest' route
          },
        ),
        title: const Text(
          'Lessons',
          style: const TextStyle(
            fontSize: 25,
            fontFamily: 'JollyFont',
            color: Colors.blue,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display the parsed text
              Column(
                children: [
                  ...widget.data.lessons?.asMap().entries.map((entry) {
                        int index = entry.key; // Get index
                        var res = entry.value; // Get lesson data
                        print('dakjldwjlakjdaadajlkjdalkjdakaa${entry.value}');
                        return InkWell(
                          onTap: () {
                            BackgroundMusicPlayer.playTapSound();

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PreExercise(
                                    data: res,
                                    passedCount: passedCount,
                                    index: index),
                              ),
                            );
                          },
                          child: Card(
                            color: Colors.blue,
                            margin: const EdgeInsets.only(
                                bottom: 10), // Add spacing between cards
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Index Number
                                  Text(
                                    "${index + 1}.", // Display index (1-based)
                                    style: const TextStyle(
                                      fontSize: 32,
                                      fontFamily: 'JollyFont',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  // Text Content Section
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          res['subject_matter'] ??
                                              'No Subject Matter', // Handle null case
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'JollyFont',
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white,
                                          ),
                                          softWrap: true,
                                          overflow: TextOverflow.clip,
                                        ),
                                        const SizedBox(height: 8),
                                      ],
                                    ),
                                  ),

                                  // Reward Card Section
                                  Card(
                                    color: Colors.white,
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
                                        "${res['assessment_average'] ?? '0%'}", // Display dynamic grade
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'JollyFont',
                                          color: Colors.blue,
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
                      }).toList() ??
                      []
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
