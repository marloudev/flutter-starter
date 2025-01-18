import 'package:empireone_mart/app/portal/home/bloc/home_bloc.dart';
import 'package:empireone_mart/app/portal/home/home.dart';
import 'package:empireone_mart/app/portal/views/views.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PortalLayout extends StatefulWidget {
  const PortalLayout({super.key});

  @override
  State<PortalLayout> createState() => _PortalLayoutState();
}

class _PortalLayoutState extends State<PortalLayout> {
  int _currentPage = 0;

  final List<Widget> _pages = [
    HomePage(), // Ensure HomePage doesn't create a new Bloc inside.
    const Center(child: Text('Rewards')),
    const Center(child: Text('History')),
    const Center(child: Text('Settings')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Topbar(),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentPage,
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.card_giftcard_outlined, size: 30, color: Colors.white),
          Icon(Icons.history, size: 30, color: Colors.white),
          Icon(Icons.settings, size: 30, color: Colors.white),
        ],
        color: Colors.blue,
        buttonBackgroundColor: Colors.blue,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          // Fetch modules when Home tab is tapped
          if (index == 0) {
            context.read<HomeBloc>().add(fetchModules());
          }

          setState(() {
            _currentPage = index;
          });
        },
      ),
      body: SingleChildScrollView(
        // Wrap the body with SingleChildScrollView for scrolling
        child: IndexedStack(
          index: _currentPage,
          children: _pages,
        ),
      ),
    );
  }
}
