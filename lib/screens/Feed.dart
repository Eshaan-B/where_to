import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Your feed'),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        )),
      ),
      body: placeList.length == 0
          ? Center(
              child: Text('Feed is empty!'),
            )
          : isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: placeList.length,
                  itemBuilder: (ctx, index) {
                    DateTime date = placeList[index].date;
                    final format = DateFormat.jm(); //"6:00 AM"
                    final time = format.format(date);

                    return Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      height: 200,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${placeList[index].userName}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Uploaded at $time",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Location:',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '${placeList[index].locationName}',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${placeList[index].userName}\'s experience:',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "${placeList[index].description}",
                                      softWrap: true,
                                      style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 15,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ],
                              ),
                              VerticalDivider(
                                thickness: 1.5,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                          'https://img.traveltriangle.com/blog/wp-content/tr:w-700,h-400/uploads/2015/06/Catherine-waterfalls-in-Coonoor.jpg',
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
