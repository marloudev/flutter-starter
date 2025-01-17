import 'package:empireone_mart/app/portal/home/home.dart';
import 'package:empireone_mart/app/portal/views/views.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class PortalLayout extends StatefulWidget {
  const PortalLayout({super.key});

  @override
  State<PortalLayout> createState() => _PortalLayoutState();
}

class _PortalLayoutState extends State<PortalLayout> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Topbar(),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        items: const <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.card_giftcard_outlined,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.history,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            size: 30,
            color: Colors.white,
          ),
        ],
        color: Colors.blue,
        buttonBackgroundColor: Colors.blue,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: SingleChildScrollView(
        child: _getPage(_page),
      ),
    );
  }

  Widget _getPage(int page) {
    switch (page) {
      case 0:
        return const Center(
          child: HomePage(),
        );
      case 1:
        return const Center(
          child: Text('Rewards'),
        );
      case 2:
        return const Center(
          child: Text('History'),
        );
      case 3:
        return Center(
          child: Text(
            'Page $page',
            style: TextStyle(fontSize: 160),
          ),
        );
      default:
        return Center(
          child: Text(
            'Page $page',
            style: TextStyle(fontSize: 160),
          ),
        );
    }
  }
}
