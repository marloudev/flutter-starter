import 'dart:convert';
import 'package:empireone_mart/app/portal/home/bloc/home_bloc.dart';
import 'package:empireone_mart/app/portal/home/quest/views/interactive.dart';
import 'package:empireone_mart/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ScorePage extends StatefulWidget {
  final id;
  final type;
  const ScorePage({super.key, required this.id, required this.type});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetScore, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial || state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetScoreLoaded) {
            final jsonResponse = json.decode(state.modules);
            print('jsonResponsejsonResponse${widget.id}');
            return Stack(
              children: [
                // Background GIF
                Positioned.fill(
                  child: Image.asset(
                    "assets/gif/score.gif",
                    fit: BoxFit.cover,
                  ),
                ),
                // Content
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(), // Push content to center
                    InteractiveText(
                        text:
                            '${jsonResponse['data']}/${jsonResponse['over']}'),
                    const SizedBox(height: 20),
                    const Spacer(), // Pushes button to bottom
                    // Button at the bottom
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 40),
                      child: SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            BackgroundMusicPlayer.playTapSound();
                            context.go('/portal');
                          },
                          child: const Text(
                            'HOMEPAGE',
                            style: TextStyle(
                                fontFamily: 'JollyFont',
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else if (state is HomeError) {
            return const Center(child: Text('Failed to load data'));
          }

          return Center(
            child: ElevatedButton(
              onPressed: () {
                context.go('/portal');
              },
              child: const Text('Press'),
            ),
          );
        },
      ),
    );
  }
}
