import 'package:empireone_mart/app/portal/home/bloc/home_bloc.dart';
import 'package:empireone_mart/app/portal/home/quest/views/_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class QuestPage extends StatefulWidget {
  final String id;

  const QuestPage({super.key, required this.id});

  @override
  State<QuestPage> createState() => _QuestPageState();
}

class _QuestPageState extends State<QuestPage> {
  String? quarter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Introductory'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.go('/home/${quarter ?? ''}');
          },
        ),
      ),
      body: BlocListener<ModuleBlocById, HomeState>(
        listener: (context, state) {
          if (state is HomeLoadedId) {
            setState(() {
              quarter = state.modules.quarter;
            });
          }
        },
        child: BlocBuilder<ModuleBlocById, HomeState>(
          builder: (context, state) {
            if (state is HomeInitial || state is HomeLoading) {
              return const SizedBox(
                height: 200,
                child: Center(child: CircularProgressIndicator()),
              );
            } else if (state is HomeLoadedId) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Introductory(data: state.modules),
                ),
              );
            } else if (state is HomeError) {
              return Center(child: Text('Failed to load posts'));
            }
            return const Center(child: Text('Unknown state'));
          },
        ),
      ),
    );
  }
}
