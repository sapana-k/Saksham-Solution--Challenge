import 'package:flutter/material.dart';

const Color color1 = Color(0xFF221D46);
Color backgroundcolor1 = Color(0xFFE7E7FF);
const color2 = Color(0xFF9191E1);

const kSendButtonTextStyle = TextStyle(
  color: color1,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: color1, width: 2.0),
  ),
);

const kRegularTextStyle =
    TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400, color: Colors.black);

const kTextFieldDecoration = InputDecoration(
  hintText: '',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: color1, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: color1, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
