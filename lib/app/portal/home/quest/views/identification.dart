import 'package:empireone_mart/main.dart';
import 'package:flutter/material.dart';

class Identification extends StatefulWidget {
  final Map<String, dynamic> data;
  final submitVoid;
  final isLoading;
  Identification(
      {Key? key, required this.data, this.submitVoid, required this.isLoading})
      : super(key: key);

  @override
  State<Identification> createState() => _IdentificationState();
}

class _IdentificationState extends State<Identification> {
  String? _selectedAnswer;
  @override
  void initState() {
    super.initState();
    _selectedAnswer = null; // Initialize to null
  }

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Answer',
            ),
            onChanged: (String? newValue) {
              setState(() {
                _selectedAnswer = newValue!; // Update local state
              });
            },
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
