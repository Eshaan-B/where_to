import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/auth.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = "/profilePage";

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
        ),
        ClipOval(
            child: Image.network(
          "url.jpg",
          fit: BoxFit.cover,
          width: 90.0,
          height: 90.0,
        )),
        // CircleAvatar(
        //   backgroundImage: ExactAssetImage('assets/user.jpg'),
        //   minRadius: 30,
        //   maxRadius: 70,
        // ),
        //backgroundImage: AssetImage(''),
        // backgroundColor: Colors.green,

        SizedBox(
          height: 80,
        ),
        Text(
            "Your username: ${Provider.of<Auth>(context, listen: false).getUsername}"),
        Container(
          decoration: new BoxDecoration(color: Colors.cyanAccent),
        )
      ],
    );
  }
}
