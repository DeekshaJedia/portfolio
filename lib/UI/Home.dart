import 'package:flutter/widgets.dart';
import 'package:portfolio/UI/HomePage.dart';
import 'package:portfolio/UI/MobileHome.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth >= 1000) {
      return HomePage();
    } else {
      return MobileHome();
    }
  }
}
