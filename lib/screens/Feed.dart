import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  static const routeName = "/feed";

  const Feed({Key? key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("MyFeed"));
  }
}
