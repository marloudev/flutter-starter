import 'package:empireone_mart/app/bg_gif.dart';
import 'package:empireone_mart/app/login/login.dart';
import 'package:empireone_mart/app/portal/home/bloc/home_bloc.dart';
import 'package:empireone_mart/app/portal/home/quest/views/score.dart';
import 'package:empireone_mart/app/portal/layout.dart';
import 'package:empireone_mart/app/portal/quarter/quarter.dart';
import 'package:empireone_mart/repository/module_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const MyAppWithMusic());

class BackgroundMusicPlayer {
  static final AudioPlayer _audioPlayer = AudioPlayer();
  static final AudioPlayer _tapAudioPlayer = AudioPlayer();

  // Play the background music in a loop
  static void playMusic() async {
    // Set the volume and loop the music before playing
    _audioPlayer.setVolume(0.1); // Set volume between 0.0 and 1.0
    _audioPlayer.setReleaseMode(ReleaseMode.loop); // Loop the music

    // Play the audio directly by passing the source to play
    await _audioPlayer.play(AssetSource('audio/bg_music.mp3'));
  }

  // Stop the background music
  static void stopMusic() {
    _audioPlayer.stop();
  }

  // Play the tap sound when the screen is tapped
  static void playTapSound() async {
    // Set the source and play the tap sound immediately
    await _tapAudioPlayer.play(AssetSource('audio/tap_music.mp3'));
    _tapAudioPlayer.setVolume(1); // Set volume for tap sound
  }
}

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => HomeBloc(
            ModuleRepository(),
          ),
          child: LoginViewPage(),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'portal',
          builder: (BuildContext context, GoRouterState state) {
            return QuarterPage();
          },
        ),
        GoRoute(
          path: '/score/:id/:type',
          builder: (BuildContext context, GoRouterState state) {
            final String? id = state.pathParameters['id']!;
            final String? type = state.pathParameters['type']!;
            return BlocProvider(
              create: (context) => GetScore(ModuleRepository(), id, type)
                ..add(
                  getScoreEvent(),
                ),
              child: ScorePage(id: id, type: type),
            );
          },
        ),
        GoRoute(
          path: '/home/:id',
          builder: (BuildContext context, GoRouterState state) {
            final String id = state.pathParameters['id']!;
            return BlocProvider(
              create: (context) => ModuleBlocByQuarter(ModuleRepository(), id)
                ..add(
                  getModuleByQuarter(),
                ),
              child: PortalLayout(id: id),
            );
          },
        ),
      ],
    ),
  ],
);

/// The main app.
class MyApp extends StatelessWidget {
  /// Constructs a [MyApp]
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

class ThemeCubit extends Cubit<ThemeData> {
  /// {@macro brightness_cubit}
  ThemeCubit() : super(_lightTheme);
  static final _lightTheme = ThemeData.light();
  static final _darkTheme = ThemeData.dark();

  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}

/// BackgroundMusicPlayer class to manage music.

/// MyAppWithMusic to auto-play background music when the app starts.
class MyAppWithMusic extends StatelessWidget {
  const MyAppWithMusic({super.key});

  @override
  Widget build(BuildContext context) {
    // Play background music when the app starts
    BackgroundMusicPlayer.playMusic();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            // Play the tap sound when the screen is tapped
            BackgroundMusicPlayer.playTapSound();
          },
          child: MyApp(),
        );
      },
    );
  }
}
