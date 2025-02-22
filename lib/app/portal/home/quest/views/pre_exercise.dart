import 'package:empireone_mart/app/portal/home/quest/quest.dart';
import 'package:empireone_mart/app/portal/home/quest/views/direction.dart';
import 'package:empireone_mart/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:html/parser.dart' as html_parser;

class PreExercise extends StatefulWidget {
  final data;
  final passedCount;
  final index;
  PreExercise({
    super.key,
    required this.data,
    required this.passedCount,
    required this.index,
  });

  @override
  State<PreExercise> createState() => _PreExerciseState();
}

class _PreExerciseState extends State<PreExercise> {
  // Function to calculate the score for a specific pre-exercise
  int calculateScore(List<dynamic> questions, List<dynamic> answers) {
    int totalScore = 0;

    for (var answer in answers) {
      totalScore += int.parse(answer['score']);
    }
    return totalScore;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pre Exercise',
          style: const TextStyle(
            fontSize: 25,
            fontFamily: 'JollyFont',
            color: Colors.blue,
            fontWeight: FontWeight.w900,
          ),
        ),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...?widget.data['pre_exercises']?.asMap().entries.map(
                          (entry) {
                            final index = entry.key;
                            final res = entry.value;
                            // Calculate the score for each pre-exercise
                            int score = calculateScore(
                                res['questions'], res['answers']);

                            return InkWell(
                              onTap: () {
                                BackgroundMusicPlayer.playTapSound();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Direction(data: res),
                                  ),
                                );
                              },
                              child: Card(
                                color: Color(0xFF89E4E1),

                                margin: const EdgeInsets.only(
                                    bottom: 10), // Add spacing between cards
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Exercise ${index + 1}', // Handle null case
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontFamily: 'JollyFont',
                                                fontWeight: FontWeight.w800,
                                                color: const Color.fromARGB(
                                                    221, 56, 54, 54),
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
                                        color: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        elevation: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 15,
                                          ),
                                          child: Text(
                                            '${score}/${res['questions'].length}', // Display the score here
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'JollyFont',
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
                          },
                        )?.toList() ??
                        [],
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  BackgroundMusicPlayer.playTapSound();
                  // stop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LessonInformation(
                        data: widget.data,
                        passedCount: widget.passedCount,
                        index: widget.index,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'GO TO ASSESSMENT',
                  style: const TextStyle(
                    fontSize: 25,
                    fontFamily: 'JollyFont',
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
