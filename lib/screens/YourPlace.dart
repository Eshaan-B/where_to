
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YourPlace extends StatelessWidget {
  static const routeName = '/YourPlace';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Location"),

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    hintText: "Your location ",
                    labelText: "Current Location",
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black),
                    border: InputBorder.none,
                    fillColor: Colors.black12,
                    filled: true),
                obscureText: false,
                maxLength: 20,
        ),
              SizedBox(
                width: 20,
                height: 250,
              ),


                Image.network('https://d32ogoqmya1dw8.cloudfront.net/images/sp/library/google_earth/google_maps_hello_world.jpg'),

                Row(
              children: [
                Align(
                alignment: Alignment.bottomLeft,
                  child: ElevatedButton(
                  onPressed: () {},
                    child: const Text('Bottom Button 1', style: TextStyle(fontSize: 20)),

                  ),
                  ),


                  SizedBox(
                  width: 16,
                ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {},
                        child: const Text('Bottom Button 2', style: TextStyle(fontSize: 20)),

    ),
    ),

    ],
    ),





    ],
    ),
    ),
    ),
    );


    }
}


