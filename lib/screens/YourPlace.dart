import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../providers/auth.dart';
import '../models/Place.dart';
import 'package:provider/provider.dart';
import '../providers/placeProvider.dart';

class YourPlace extends StatefulWidget {
  static const routeName = '/YourPlace';

  @override
  _YourPlaceState createState() => _YourPlaceState();
}

class _YourPlaceState extends State<YourPlace> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = new TextEditingController();

    void _submit() async {
      setState(() {
        isLoading = true;
      });
      String name = nameController.text;
//      final description = descriptionController.value;
      String uname = Provider.of<Auth>(context, listen: false).getUsername;
      Place newPlace = Place(
        locationName: name,
        latitude: 100.0,
        longitude: 100.0,
        userName: uname,
        staticMap:
            "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.wired.com%2F2016%2F11%2Fuse-google-maps-plan-awesome-vacation%2F&psig=AOvVaw3BQwYMItPstnHoa3NY46dL&ust=1628438730466000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCLjcnpOln_ICFQAAAAAdAAAAABAD",
        date: DateTime.now(),
      );

      await Provider.of<Places>(context, listen: false).addPlace(newPlace);
      setState(() {
        isLoading = false;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Add location'),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        )),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        height: MediaQuery.of(context).size.height - 100,
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Name of this place",
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black),
                    border: InputBorder.none,
                    filled: true,
                  ),
                  maxLength: 20,
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "How was your experience?",
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black),
                    border: InputBorder.none,
                    filled: true,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Image.network(
                  'https://d32ogoqmya1dw8.cloudfront.net/images/sp/library/google_earth/google_maps_hello_world.jpg',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: Text("Grab my location")),
                    SizedBox(
                      width: 16,
                    ),
                    isLoading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: _submit,
                            child: Text("Post!"),
                          )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
