import 'package:empireone_mart/app/portal/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class QuestPage extends StatefulWidget {
  final id;
  const QuestPage({super.key, this.id});

  @override
  State<QuestPage> createState() => _QuestPageState();
}

class _QuestPageState extends State<QuestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quest${widget.id}'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.go('/portal'); // Navigate to the '/quest' route
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: BlocBuilder<ModuleBlocById, HomeState>(
            builder: (context, state) {
              if (state is HomeInitial || state is HomeLoading) {
                return const SizedBox(
                  height: 200,
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (state is HomeLoadedId) {
                print('djakjdwaklwdwlajkd${state.modules.title}');
                return Column(
                  children: [
                    // const HomeCard(),
                    // HomeActivities(modules: state.modules),
                    Text('Done Load ${state.modules.title}')
                  ],
                );
              } else if (state is HomeError) {
                return Center(child: Text('Failed to load posts:'));
              }
              return const Center(child: Text('Unknown state'));
            },
          ),
        ),
      ),
    );
  }
}
