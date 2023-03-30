import 'package:flutter/material.dart';

import 'const.dart';

class RoundCards extends StatelessWidget {
  IconData icon;
  String text;
  RoundCards({required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Icon(
              icon,
              color: Color(0xFF221D46),
              size: 66.0,
            ),
            SizedBox(
              height: 3.0,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17.0),
            )
          ],
        ),
      ),
      elevation: 3.0,
      //shape: CircleBorder(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
    );
  }
}

class tileCard extends StatelessWidget {
  IconData icon;
  String text;
  VoidCallback toDo;
  tileCard({required this.icon, required this.text, required this.toDo});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Color(0xFFFFF4F4),
        onTap: toDo,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 120.0,
            minWidth: 120.0,
            maxHeight: 120.0,
            minHeight: 120.0,
          ),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              children: [
                Icon(
                  icon,
                  color: color1,
                  size: 60.0,
                ),
                SizedBox(
                  height: 7.0,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: color1,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      elevation: 3.0,
      //shape: CircleBorder(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
    );
  }
}

class RoundedButton extends StatelessWidget {
  //data members
  final Color buttonColor;
  final String buttonText;
  final VoidCallback toDo;
  //constructor
  RoundedButton(
      {required this.buttonColor,
      required this.buttonText,
      required this.toDo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: buttonColor,
        //color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: toDo,
          // onPressed: () {
          //   //Go to login screen.
          //   Navigator.pushNamed(context, LoginScreen.id);
          // },
          minWidth: 200.0,
          height: 50.0,
          child: Text(buttonText,
              style: TextStyle(color: Colors.white, fontSize: 16.0)),
        ),
      ),
    );
  }
}
