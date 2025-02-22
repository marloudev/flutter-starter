import 'package:empireone_mart/app/portal/home/quest/views/assessment.dart';
import 'package:empireone_mart/main.dart'; // Ensure this file contains BackgroundMusicPlayer
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatefulWidget {
  final data; // Define explicit type
  final passedCount;
  final index;
  MyWebView(
      {super.key,
      required this.data,
      required this.index,
      required this.passedCount});

  @override
  State<MyWebView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  late final WebViewController _controller;
  final FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.data['link'])); // Use a valid URL
  }

  Future<void> stop() async {
    await flutterTts.stop();
  }

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

  // int countAsnwerQuestions(final data) {
  //   if (data['pre_exercises'] == null || data['pre_exercises'] is! List) {
  //     return 0; // Return 0 if pre_exercises is not present or not a list
  //   }

  //   List preExercises = data['pre_exercises'];
  //   int totalAnswer = 0;

  //   for (var preExercise in preExercises) {
  //     if (preExercise['answer'] != null && preExercise['answer'] is List) {
  //       final int questCount = preExercise['answer'].length;

  //       totalAnswer += questCount;
  //     }
  //   }
  //   return totalAnswer;
  // }

  @override
  Widget build(BuildContext context) {
    int totalQuestions = countPreExerciseQuestions(widget.data);
    int totalAnswers = widget.data['answer_count'];
    print('dakjdlkajdaaaaaaaaaasss${widget.data['answer_count']}');
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.blue,
            size: 40,
          ),
          onPressed: () {
            BackgroundMusicPlayer.playTapSound();
            context.pop();
          },
        ),
        title: Text(
          'Video Lesson',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'JollyFont',
            color: Colors.blue,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Expanded(
                child:
                    WebViewWidget(controller: _controller)), // Wrap in Expanded
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.passedCount >= widget.index &&
                          totalAnswers == totalQuestions
                      ? Colors.blue
                      : Colors.grey,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  BackgroundMusicPlayer.playTapSound();
                  stop();
                  if (widget.passedCount >= widget.index &&
                      totalAnswers == totalQuestions) {
                    BackgroundMusicPlayer.playTapSound();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Assessment(data: widget.data),
                      ),
                    );
                  }
                },
                child: const Text(
                  'ASSESSMENT',
                  style: const TextStyle(
                    fontSize: 25,
                    fontFamily: 'JollyFont',
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
