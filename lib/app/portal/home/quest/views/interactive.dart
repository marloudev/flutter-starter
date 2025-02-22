import 'package:flutter/material.dart';

class InteractiveText extends StatefulWidget {
  final text;
  InteractiveText({super.key, required this.text});

  @override
  State<InteractiveText> createState() => _InteractiveTextState();
}

class _InteractiveTextState extends State<InteractiveText> {
  @override
  Widget build(BuildContext context) {
    print('widget.text${widget.text}');
    return GestureDetector(
      // onTap: _increaseCounter,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: [Colors.red, Colors.blue],
            ).createShader(bounds);
          },
          child: Text(
            '${widget.text}',
            style: TextStyle(
              fontFamily: 'JollyFont',
              fontSize: 100, // Animate font size
              fontWeight: FontWeight.w900,
              color: Colors.white, // Required for ShaderMask
              shadows: [
                Shadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(2, 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
