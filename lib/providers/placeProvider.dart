import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'auth.dart';
import '../models/Place.dart';

class Places with ChangeNotifier {
  List<Place> _placeList = [];

  Future<void> addPlace(Place place) async {
    final url = Uri.parse(
        "https://whereto-d2421-default-rtdb.firebaseio.com/places.json");
    try {
      final extractedData = await http.post(
        url,
        body: json.encode({
          'latitude': place.latitude,
          'longitude': place.longitude,
          'date': place.date.toIso8601String(),
          'staticMap': place.staticMap,
          'userName': place.userName,
          'name':place.locationName
        }),
      );
      final res = json.decode(extractedData.body);
      print(res);
    } catch (err) {
      print(err);
      throw err;
    }
  }
}
