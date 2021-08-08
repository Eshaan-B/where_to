import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Place.dart';

class Places with ChangeNotifier {
  List<Place> _placeList = [];

  List<Place> get placeList {
    return [..._placeList];
  }

  bool get isEmpty {
    return _placeList.isEmpty;
  }

  Future<void> fetchAndSetPlaces() async {
    final url = Uri.parse(
        'https://whereto-d2421-default-rtdb.firebaseio.com/places.json');
    try {
      final res = await http.get(url);
      final extractedData = json.decode(res.body);
      print(extractedData);
      final List<Place> _loadedPlaces = [];
      if (extractedData != null) {
        extractedData.forEach((placeId, placeData) {
          _loadedPlaces.add(
            Place(
              date: DateTime.parse(placeData['date']),
              latitude: placeData['latitude'],
              longitude: placeData['longitude'],
              userName: placeData['userName'],
              staticMap: placeData['staticMap'],
              locationName: placeData['locationName'],
            ),
          );
        });
        _placeList=_loadedPlaces.reversed.toList();
        notifyListeners();
      }

    } catch (err) {
      print("Error occured while fetching places:");
      print(err);
      throw err;
    }
  }

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
          'locationName': place.locationName
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
