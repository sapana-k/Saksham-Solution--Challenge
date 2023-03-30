import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import '../../constants/modifiedCards.dart';
import '../../constants/const.dart';

class InsuranceSchemePage extends StatefulWidget {
  const InsuranceSchemePage({Key? key}) : super(key: key);
  static const String id = 'insurance_screen';
  @override
  State<InsuranceSchemePage> createState() => _InsuranceSchemePageState();
}

class _InsuranceSchemePageState extends State<InsuranceSchemePage> {
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
              ListTile(
                  title: Text(
                      'Swavlamban Health Insurance Scheme for Persons with Disabilities')),
              ListTile(
                  title: Text(
                      'Income Tax 80DD Deduction: Dependant who is a Person With Disability')),
              ListTile(
                  title: Text(
                      'Incentives to private sector for employing persons with disability')),
              ListTile(
                  title: Text(
                      'Social Security Scheme for Persons with disabilities : Karnataka')),
              ListTile(
                  title: Text(
                      'Financial Assistance to Parents Association for Mentally Retarded Persons')),
              ListTile(
                  title:
                      Text('Equal insurance benefits for differently-abled')),
            ],
          ),
        ),
      ),
    );
  }
}
