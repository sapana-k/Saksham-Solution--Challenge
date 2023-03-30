import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import '../../constants/modifiedCards.dart';
import '../../constants/const.dart';

class RTIPage extends StatefulWidget {
  const RTIPage({Key? key}) : super(key: key);
  static const String id = 'RTI_screen';
  @override
  State<RTIPage> createState() => _RTIPageState();
}

class _RTIPageState extends State<RTIPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor1,
      appBar: AppBar(
        title: Text('Saksham'),
        backgroundColor: color1,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(35.0, 18.0, 35.0, 18.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ListTile(title: Text('fact 1')),
              ListTile(title: Text('fact 2')),
              ListTile(title: Text('fact 3')),
              ListTile(title: Text('fact 4')),
            ],
          ),
        ),
      ),
    );
  }
}
