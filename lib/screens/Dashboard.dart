import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'Feed.dart';
import 'YourPlace.dart';

class Dashboard extends StatefulWidget {
  static const routeName = "/dashboard";

  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int index = 0;
  List<Widget> pages = [
    Feed(),
    YourPlace(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: [Icon(Icons.home), Icon(Icons.add)],
        buttonBackgroundColor: Colors.blue,
        color: Colors.blue,
        backgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 250),
        height: 60,
        index: 0,
        onTap: (i) {
          //change page
          setState(() {
            index = i;
          });
        },
      ),
      body: pages[index],
    );
  }
}
