import 'package:empireone_mart/main.dart';
import 'package:flutter/material.dart';

class MultipleChoice extends StatefulWidget {
  final Map<String, dynamic> data;
  final submitVoid;
  final isLoading;
  MultipleChoice(
      {Key? key, required this.data, this.submitVoid, required this.isLoading})
      : super(key: key);

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  @override
  String? _selectedAnswer; // Nullable to handle no selection

  @override
  void initState() {
    super.initState();
    _selectedAnswer = null; // Initialize to null
  }

  List<String> options = ['A', 'B', 'C', 'D'];
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 8),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: options.map((option) {
                  return Row(
                    children: [
                      Text(option),
                      Radio<String>(
                        value: option,
                        groupValue: _selectedAnswer,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedAnswer = newValue!; // Update local state
                          });
                          BackgroundMusicPlayer.playTapSound();
                        },
                      ),
                    ],
                  );
                }).toList(),
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
                            widget.submitVoid(
                                _selectedAnswer, widget.data['id']);
                          },
                    child: widget.isLoading
                        ? const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
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
          )
        ],
      ),
    );
  }
}
