import 'package:empireone_mart/main.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as html_parser;

class TrueOrFalse extends StatefulWidget {
  final Map<String, dynamic> data;
  final submitVoid;
  final isLoading;
  TrueOrFalse(
      {Key? key, required this.data, this.submitVoid, required this.isLoading})
      : super(key: key);

  @override
  State<TrueOrFalse> createState() => _TrueOrFalseState();
}

class _TrueOrFalseState extends State<TrueOrFalse> {
  bool _isExpanded = false;
  String? _selectedAnswer; // Nullable to handle no selection

  @override
  void initState() {
    super.initState();
    _selectedAnswer = null; // Initialize to null
  }

  @override
  Widget build(BuildContext context) {
    // Parse the question from HTML content
    // var document = html_parser.parse(widget.data['question']);
    // String question = document.body?.text ?? 'No question provided';

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 8),
          // True/False options
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Radio<String>(
                      value: 'True',
                      groupValue: _selectedAnswer,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedAnswer = newValue; // Update selected answer
                        });
                      },
                    ),
                    const Text('True'),
                  ],
                ),
                Column(
                  children: [
                    Radio<String>(
                      value: 'False',
                      groupValue: _selectedAnswer,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedAnswer = newValue; // Update selected answer
                        });
                      },
                    ),
                    const Text('False'),
                  ],
                ),
              ],
            ),
          ),
          // Display selected answer for debugging
          if (_selectedAnswer != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Selected Answer: $_selectedAnswer',
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: widget.isLoading
                    ? null // Disable button while loading
                    : () {
                        BackgroundMusicPlayer.playTapSound();
                        widget.submitVoid(_selectedAnswer, widget.data['id']);
                      },
                child: widget.isLoading
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : const Text(
                        'NEXT QUESTION',
                        style: const TextStyle(
                          fontSize: 25,
                          fontFamily: 'JollyFont',
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
