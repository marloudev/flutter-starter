import 'package:empireone_mart/app/portal/home/quest/quest.dart';
import 'package:empireone_mart/app/portal/home/quest/views/direction2.dart';
import 'package:empireone_mart/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:html/parser.dart' as html_parser;

class Assessment extends StatefulWidget {
  final data;
  Assessment({super.key, required this.data});

  @override
  State<Assessment> createState() => _AssessmentState();
}

class _AssessmentState extends State<Assessment> {
  @override
  Widget build(BuildContext context) {
    int calculateScore(List<dynamic> questions, List<dynamic> answers) {
      int totalScore = 0;

      for (var answer in answers) {
        totalScore += int.parse(answer['score']);
      }
      return totalScore;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Assessment',
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Display the parsed text
                    ...?widget.data['assessments']
                            ?.asMap()
                            .entries
                            .map((entry) {
                          final index = entry.key;
                          final res = entry.value;
                          int score =
                              calculateScore(res['questions'], res['answers']);
                          return InkWell(
                            onTap: () {
                              BackgroundMusicPlayer.playTapSound();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Direction2(data: res),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Assessment ${index + 1}', // Handle null case
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
                                          '$score/${res['questions'].length}',
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
                        })?.toList() ??
                        [],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
