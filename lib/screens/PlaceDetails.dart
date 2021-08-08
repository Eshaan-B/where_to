import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../models/Place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceDetails extends StatefulWidget {
  static const routeName = "/placeDetails";

  const PlaceDetails({Key? key}) : super(key: key);

  @override
  _PlaceDetailsState createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    Place place = ModalRoute.of(context)!.settings.arguments as Place;

    Completer<GoogleMapController> _controller = Completer();

    return Scaffold(
      appBar: AppBar(
        title: Text('${place.userName}\'s travel'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          Container(
              width: double.infinity,
              height: 300,
              child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(place.latitude, place.longitude),
                      zoom: 12))),
          Text(
            'Place visited:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          Text('${place.locationName}', style: TextStyle(fontSize: 15)),
          Divider(),
          Text(
            '${place.userName}\'s Experience',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          Text('${place.description}', style: TextStyle(fontSize: 15)),
          Divider(),
          Text(
            'Coordinates :',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          Text(' Latitude: ${place.latitude} \n Longitude: ${place.longitude}',
              style: TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}
