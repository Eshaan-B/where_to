import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/placeProvider.dart';
import '../models/Place.dart';

class Feed extends StatefulWidget {
  static const routeName = "/feed";

  const Feed({Key? key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  bool isInit = true;
  bool isLoading = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (isInit) {
      setState(() {
        isLoading = true;
      });
      Provider.of<Places>(context).fetchAndSetPlaces().then((_) {
        setState(() {
          isLoading = false;
        });
      });
      isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Place> placeList =
        Provider.of<Places>(context, listen: false).placeList;
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: placeList.length,
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                child: Text("${placeList[index].locationName}"),
              );
            });
  }
}
