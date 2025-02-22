// import 'package:flutter/material.dart';
// import 'package:flutter_gifimage/flutter_gifimage.dart';

// class BackgroundGifPlayer extends StatefulWidget {
//   @override
//   _BackgroundGifPlayerState createState() => _BackgroundGifPlayerState();
// }

// class _BackgroundGifPlayerState extends State<BackgroundGifPlayer> {
//   late GifController _gifController;

//   @override
//   void initState() {
//     super.initState();
//     _gifController = GifController(vsync: this);
//   }

//   @override
//   void dispose() {
//     _gifController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Positioned.fill(
//       child: GifImage(
//         controller: _gifController,
//         image: AssetImage('assets/gif/bg.gif'),
//         fit: BoxFit.cover, // Ensures the GIF covers the entire screen
//       ),
//     );
//   }
// }
