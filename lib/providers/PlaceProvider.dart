import 'package:flutter/foundation.dart';

class Place with ChangeNotifier {
  double latitude;
  double longitude;
  String staticMap;
  String userId;

  Place({
    required this.latitude,
    required this.longitude,
    required this.userId,
    required this.staticMap,
  });
}
