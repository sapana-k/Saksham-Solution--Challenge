import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import '../../constants/modifiedCards.dart';
import '../../constants/const.dart';

class GovSchemesPage extends StatefulWidget {
  const GovSchemesPage({Key? key}) : super(key: key);
  static const String id = 'govScheme_screen';
  @override
  State<GovSchemesPage> createState() => _GovSchemesPageState();
}

class _GovSchemesPageState extends State<GovSchemesPage> {
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
              ListTile(title: Text('Government Schemes for PwD ')),
              ListTile(
                  title: Text('1. Special Education and Vocational Training')),
              ListTile(
                  title: Text(
                      '2. Non-Governmental Aided organization (Special Schools and Vocational Training Centre) for Disable.')),
              ListTile(
                  title: Text(
                      '3. Financial Assistance for Aids and Appliances for Disabled Persons')),
              ListTile(
                  title: Text(
                      '4. Financial Assistance to Self-Employment for Trained Disabled Persons')),
              ListTile(title: Text('5. Grant in Aid to Old age home.')),
              ListTile(
                  title: Text('6. The Scheme of State Award for Disabled.')),
            ],
          ),
        )));
  }
}
