import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import '../../constants/modifiedCards.dart';
import '../../constants/const.dart';

class Transport extends StatefulWidget {
  const Transport({Key? key}) : super(key: key);
  static const String id = 'transport_screen';
  @override
  State<Transport> createState() => _TransportState();
}

class _TransportState extends State<Transport> {
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
            children: <Widget>[
              ListTile(title: Text('BUS1')),
              ListTile(title: Text('BUS2')),
              ListTile(title: Text('BUS3')),
            ],
          ),
        ),
      ),
    );
  }
}
