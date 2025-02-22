import 'package:empireone_mart/app/portal/home/quest/quest.dart';
import 'package:empireone_mart/app/portal/home/quest/views/text_speech.dart';
import 'package:empireone_mart/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:flutter_tts/flutter_tts.dart';

class Introductory extends StatefulWidget {
  final dynamic data;
  Introductory({super.key, required this.data});

  @override
  State<Introductory> createState() => _IntroductoryState();
}

class _IntroductoryState extends State<Introductory> {
  final FlutterTts flutterTts = FlutterTts();

  Future<void> stop() async {
    await flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    var direct = html_parser.parse(widget.data.introductory);
    String introductoryText = direct.body?.text ?? '';

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
        title: const Text(
          'Introductory',
          style: TextStyle(
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
              TextSpeech(text: introductoryText),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(55, 100, 55, 80),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          introductoryText,
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
                          builder: (context) => Wintn(data: widget.data),
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
