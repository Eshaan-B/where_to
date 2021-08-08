import 'package:flutter/material.dart';

import '../models/Place.dart';

class PlaceDetails extends StatefulWidget {
  static const routeName = "/placeDetails";

  const PlaceDetails({Key? key}) : super(key: key);

  @override
  _PlaceDetailsState createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {
  @override
  Widget build(BuildContext context) {
    Place place = ModalRoute.of(context)!.settings.arguments as Place;
    //place.userName

    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
      color: Colors.white,
      child: Column(
        children: [
          Text('${place.userName}`s Places',
            style: TextStyle(fontSize: 28,
                decoration: TextDecoration.none,
            color: Colors.black),

          ),
          SizedBox(
            height: 30,
            width: 30
          ),
          Container(
            color: Colors. lightBlue,
            padding: EdgeInsets.fromLTRB(30.0, 250.0, 0.0, 0.0),
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),

          ),
          SizedBox(
              height: 30,
              width: 30
          ),
          Text('Description of ${place.locationName}',
            style: TextStyle(fontSize: 28,
                decoration: TextDecoration.none,
                color: Colors.black),
          ),
          SizedBox(
              height: 30,
              width: 30
          ),
          Text('${place.description}',
            style: TextStyle(fontSize: 18,
                decoration: TextDecoration.none,
                color: Colors.black),
          ),
          SizedBox(
              height: 30,
              width: 30
          ),
          Text('Images of ${place.locationName}',
            style: TextStyle(fontSize: 28,
                decoration: TextDecoration.none,
                color: Colors.black),
          ),
          Row(
            children: [
              Container(
                color: Colors. lightBlue,
                margin: const EdgeInsets.all(20.0),
                width: 160.0,
                height: 140.0,

              ),

              Container(
                color: Colors. lightBlue,
                margin: const EdgeInsets.all(10.0),
                width: 160.0,
                height: 140.0,

              ),
            ],
          )



        ],
      ),


    );
  }
}
