import 'package:empireone_mart/app/portal/views/_views.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: PortalTopbar(),
          automaticallyImplyLeading: false,
        ),
        // body: const Padding(
        //   padding: EdgeInsets.all(10),
        //   child: Column(
        //     children: [
        //       HomeCard(),
        //       HomeActivities()
        //     ],
        //   ),
        // ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          items: const <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.call_split, size: 30),
          ],
          color: Colors.blue,
          buttonBackgroundColor: Colors.blue,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              if (_page == 0) ...[
                PortalCard(),
                PortalActivities(),
              ],
              if (_page == 1)
                Text(
                  _page.toString(),
                  style: TextStyle(fontSize: 160),
                ),
              if (_page == 2)
                Text(
                  _page.toString(),
                  style: TextStyle(fontSize: 160),
                ),
              if (_page == 3)
                Text(
                  _page.toString(),
                  style: TextStyle(fontSize: 160),
                ),
            ],
          ),
        ));
  }
}
