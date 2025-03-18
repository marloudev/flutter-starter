import 'package:empireone_mart/app/portal/home/quest/quest.dart';
import 'package:empireone_mart/app/portal/home/quest/views/text_speech.dart';
import 'package:empireone_mart/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_html/flutter_html.dart';

class Wintn extends StatefulWidget {
  final data;
  Wintn({super.key, required this.data});

  @override
  State<Wintn> createState() => _WintnState();
}

class _WintnState extends State<Wintn> {
  final FlutterTts flutterTts = FlutterTts();
  @override
  Widget build(BuildContext context) {
    var direct = html_parser.parse(widget.data.wintn);
    String direction = direct.body?.text ?? '';

    Future<void> stop() async {
      await flutterTts.stop();
    }

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
          'What I Need To Know',
          style: const TextStyle(
            fontSize: 25,
            fontFamily: 'JollyFont',
            color: Colors.blue,
            fontWeight: FontWeight.w900,
          ),
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
                          data: widget.data.wintn,
                          style: {
                            "body": Style(
                              color: Colors.white, // Set text color to white
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center,
                            ),
                            "p": Style(
                              textAlign:
                                  TextAlign.justify, // Justify paragraph text
                              color: Colors.white,
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
                          builder: (context) => Lesson(data: widget.data),
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
