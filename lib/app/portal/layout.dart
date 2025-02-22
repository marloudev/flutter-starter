import 'package:empireone_mart/app/portal/home/home.dart';
import 'package:empireone_mart/app/portal/views/views.dart';
import 'package:empireone_mart/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PortalLayout extends StatefulWidget {
  final id;
  PortalLayout({super.key, this.id});

  @override
  State<PortalLayout> createState() => _PortalLayoutState();
}

class _PortalLayoutState extends State<PortalLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Topbar(),
        // automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue,
            size: 40,
          ),
          onPressed: () {
            BackgroundMusicPlayer.playTapSound();
            context.go('/portal'); // Navigate to the '/quest' route
          },
        ),
      ),
      body: SingleChildScrollView(
        child: HomePage(),
      ),
    );
  }
}
