import 'package:empireone_mart/app/portal/home/quest/quest.dart';
import 'package:empireone_mart/app/portal/home/quest/views/assessment.dart';
import 'package:empireone_mart/app/portal/home/quest/views/text_speech.dart';
import 'package:empireone_mart/app/portal/home/quest/views/web_view.dart';
import 'package:empireone_mart/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:url_launcher/url_launcher.dart';

class LessonInformation extends StatefulWidget {
  final Map<String, dynamic> data;
  final int passedCount;
  final int index;
  const LessonInformation(
      {super.key,
      required this.data,
      required this.passedCount,
      required this.index});

  @override
  State<LessonInformation> createState() => _LessonInformationState();
}

class _LessonInformationState extends State<LessonInformation> {
  // Function to count questions in pre_exercises
  int countPreExerciseQuestions(final data) {
    if (data['pre_exercises'] == null || data['pre_exercises'] is! List) {
      return 0; // Return 0 if pre_exercises is not present or not a list
    }

    List preExercises = data['pre_exercises'];
    int totalQuestions = 0;

    for (var preExercise in preExercises) {
      if (preExercise['questions'] != null &&
          preExercise['questions'] is List) {
        final int questCount = preExercise['questions'].length;
        totalQuestions += questCount;
      }
    }
    return totalQuestions;
  }

  int countAsnwerQuestions(final data) {
    if (data['pre_exercises'] == null || data['pre_exercises'] is! List) {
      return 0; // Return 0 if pre_exercises is not present or not a list
    }

    List preExercises = data['pre_exercises'];
    int totalAnswer = 0;

    for (var preExercise in preExercises) {
      if (preExercise['answer'] != null && preExercise['answer'] is List) {
        final int questCount = preExercise['answer'].length;
        totalAnswer += questCount;
      }
    }
    return totalAnswer;
  }

  @override
  Widget build(BuildContext context) {
    // Parsing the 'discussion' field
    final FlutterTts flutterTts = FlutterTts();
    var direct = html_parser.parse(widget.data['discussion'] ?? '');
    String discussion = direct.body?.text ?? '';

    // Count the total number of pre-exercise questions
    int totalQuestions = countPreExerciseQuestions(widget.data);
    int totalAnswers = countAsnwerQuestions(widget.data);
    print('widget.datawidget.data${totalAnswers}');

    print('dakdwjwaljdlakwda${widget.data}');

    Future<void> stop() async {
      await flutterTts.stop();
    }

    Future<void> openURL() async {
      final Uri url = Uri.parse(widget.data['link']); // Change to your link

      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch $url');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lesson Information',
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
      body: Stack(
        children: [
          // Background GIF
          Positioned.fill(
            child: Image.asset(
              "assets/gif/board.gif",
            ),
          ),

          // Scrollable Content
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextSpeech(text: discussion),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(55, 100, 55, 80),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        widget.data['file'] != null &&
                                widget.data['file'].isNotEmpty
                            ? Image.network(
                                widget.data['file'],
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return Center(
                                    child: Icon(
                                      Icons.error_outline,
                                      size: 50,
                                      color: Colors.red,
                                    ),
                                  );
                                },
                              )
                            : Container(),
                        const SizedBox(height: 20),
                        Text(
                          discussion,
                          style: TextStyle(
                              fontFamily: 'JollyFont', color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      BackgroundMusicPlayer.playTapSound();
                      stop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyWebView(
                              data: widget.data,
                              passedCount: widget.passedCount,
                              index: widget.index),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      'NEXT',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'JollyFont',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
