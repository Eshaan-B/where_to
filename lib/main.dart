import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:where_to/screens/Dashboard.dart';
import 'providers/auth.dart';
import 'screens/AuthScreen.dart';
import 'providers/placeProvider.dart';
import 'screens/YourPlace.dart';
import 'screens/Feed.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const Map<int, Color> color = {
    50: Color.fromRGBO(136, 14, 79, .1),
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    600: Color.fromRGBO(136, 14, 79, .7),
    700: Color.fromRGBO(136, 14, 79, .8),
    800: Color.fromRGBO(136, 14, 79, .9),
    900: Color.fromRGBO(136, 14, 79, 1),
  };

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Places(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: "WhereTo?",
          home: auth.isAuthenticated ? Dashboard() : AuthScreen(),
          routes: {
            //add routes to your pages here
            Dashboard.routeName: (ctx) => Dashboard(),
            AuthScreen.routeName: (ctx) => AuthScreen(),
            YourPlace.routeName: (ctx) => YourPlace(),
            Feed.routeName:(ctx)=>Feed(),
          },
        ),
      ),
    );
  }
}
