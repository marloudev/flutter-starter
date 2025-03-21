import 'package:empireone_mart/app/portal/home/quest/quest.dart';
import 'package:empireone_mart/app/portal/home/quest/views/text_speech.dart';
import 'package:empireone_mart/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:go_router/go_router.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:flutter_html/flutter_html.dart';

class Direction2 extends StatefulWidget {
  final data;
  Direction2({super.key, required this.data});

  @override
  State<Direction2> createState() => _Direction2State();
}

class _Direction2State extends State<Direction2> {
  final FlutterTts flutterTts = FlutterTts();
  Future<void> stop() async {
    await flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    var direct = html_parser.parse(widget.data['direction']);
    String direction = direct.body?.text ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Direction',
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
              TextSpeech(text: direction),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(55, 100, 55, 80),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        // Text(
                        //   direction,
                        //   style: TextStyle(
                        //       fontFamily: 'JollyFont', color: Colors.white),
                        // ),
                        Html(
                          data: widget.data['direction'],
                          style: {
                            "body": Style(
                              color: Colors.white, // Set text color to white
                              fontWeight: FontWeight.bold,
                            ),
                          },
                        )
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
                          builder: (context) =>
                              Quest(data: widget.data, type: 'assessment'),
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
