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
      child: Text('${place.userName}'),
    );
  }
}
