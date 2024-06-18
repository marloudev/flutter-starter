import 'package:empireone_mart/app/home/views/_views.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: HomeTopbar(),
        automaticallyImplyLeading: false,
      ),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            HomeCard(),
            HomeActivities()
            // Container(
            //   width: double.infinity,
            //   child: SizedBox(
            //     height: 40,
            //     child: ElevatedButton(
            //         style: ElevatedButton.styleFrom(
            //           backgroundColor: Colors.blue,
            //           foregroundColor: Colors.white,
            //           shape: const BeveledRectangleBorder(
            //             borderRadius: BorderRadius.zero,
            //           ),
            //         ),
            //         onPressed: () {
            //           context.go('/');
            //         },
            //         child: const Text('LOGIN')),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
