import 'package:empireone_mart/app/engagement/home/bloc/home_bloc.dart';
import 'package:empireone_mart/app/engagement/home/views/_views.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     HomeCard(),
    //     HomeActivities(),
    //   ],
    // );
    return Center(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          // Return a widget based on the state
          if (state is HomeInitial || state is HomeLoading) {
            return Container(
              height: 200, // Adjust the height as needed
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
          } else if (state is HomeLoaded) {
            return Column(
              children: [
                HomeCard(),
                HomeActivities(activities: state.posts),
              ],
            );
          } else if (state is HomeError) {
            return Center(child: Text('Failed to load posts'));
          }
          return Center(child: Text('Unknown state'));
        },
      ),
    );
  }
}
