import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:empireone_mart/app/portal/views/_views.dart';

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
        title: PortalTopbar(),
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
            Icons.compare_arrows,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.call_split,
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
      body: _getPage(_page),
    );
  }

  Widget _getPage(int page) {
    switch (page) {
      case 0:
        return const SingleChildScrollView(
          child: Column(
            children: [
              HomeCard(),
              HomeActivities(),
            ],
          ),
        );
      case 1:
        return Center(
          child: RewardPage(),
        );
      case 2:
        return Center(
          child: Text(
            'Page $page',
            style: TextStyle(fontSize: 160),
          ),
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
