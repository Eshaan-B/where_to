
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token="";
  String userName="";

  String get getUsername{
    print("Username is set to $userName");
    return userName;
  }
  bool get isAuthenticated{
    return _token!="";
  }


  Future<void> signIn(String uname) async {
    try {
      final url = Uri.parse(
          "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyB6fmAtm1eH3Bz6n4YsWeQYnzTNmZ_gVR4");
      final extractedData = await http.post(
        url,
        body: json.encode({'returnSecureToken': true}),
      );
      final res = json.decode(extractedData.body);
      _token=res['idToken'];
      userName=uname;
      notifyListeners();
     // print("Username is set to $userName");
    } catch (err) {
      print("Error in Auth:");
      print(err);
    }
  }
}
