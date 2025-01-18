import 'package:empireone_mart/app/portal/home/bloc/home_bloc.dart';
import 'package:empireone_mart/app/portal/home/views/_views.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial || state is HomeLoading) {
            return const SizedBox(
              height: 200,
              child: Center(child: CircularProgressIndicator()),
            );
          } else if (state is HomeLoaded) {
            return Column(
              children: [
                const HomeCard(),
                HomeActivities(modules: state.modules),
              ],
            );
          } else if (state is HomeError) {
            return Center(child: Text('Failed to load posts:'));
          }
          return const Center(child: Text('Unknown state'));
        },
      ),
    );
  }
}
