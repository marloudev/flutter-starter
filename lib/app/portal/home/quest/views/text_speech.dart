import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextSpeech extends StatefulWidget {
  final String text;
  TextSpeech({super.key, required this.text});

  @override
  State<TextSpeech> createState() => _TextSpeechState();
}

class _TextSpeechState extends State<TextSpeech> {
  final FlutterTts flutterTts = FlutterTts();
  bool isSpeaking = false; // Track if speech is active

  @override
  void initState() {
    super.initState();
    flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeaking = false; // Reset when speech is done
      });
    });
  }

  Future<void> speak() async {
    if (widget.text.isNotEmpty) {
      setState(() {
        isSpeaking = true;
      });
      await flutterTts.setVoice({"name": "fil-PH", "locale": "fil-PH"});
      await flutterTts.setSpeechRate(0.4); // 0.5 = slower, clearer speech
      await flutterTts.setPitch(1.0); // 1.0 = normal pitch
      await flutterTts.speak(widget.text);
    }
  }

  Future<void> stop() async {
    await flutterTts.stop();
    setState(() {
      isSpeaking = false; // Reset when manually stopped
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // if (!isSpeaking)
        ElevatedButton(
          onPressed: speak,
          child: Text("Speak"),
        ),
        SizedBox(width: 16),
        ElevatedButton(
          onPressed: stop,
          child: Text(
            "Stop",
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 190, 30, 19)),
        ),
      ],
    );
  }
}
