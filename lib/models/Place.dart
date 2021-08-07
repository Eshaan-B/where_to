
class Place{
  //String description;
  String locationName;
  double latitude;
  double longitude;
  String staticMap;
  String userName;
  DateTime date;

  Place({
    required this.latitude,
    required this.longitude,
    required this.userName,
    required this.staticMap,
    required this.date,
  //  required this.description,
    required this.locationName
  });
}
