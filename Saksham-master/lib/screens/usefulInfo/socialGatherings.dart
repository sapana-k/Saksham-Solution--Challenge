import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import '../../constants/modifiedCards.dart';
import '../../constants/const.dart';

class SocialGatheringPage extends StatefulWidget {
  const SocialGatheringPage({Key? key}) : super(key: key);
  static const String id = 'social_screen';
  @override
  State<SocialGatheringPage> createState() => _SocialGatheringPageState();
}

class _SocialGatheringPageState extends State<SocialGatheringPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor1,
      appBar: AppBar(
        title: Text('Saksham'),
        backgroundColor: color1,
      ),
      body: Center(
        child: Container(),
      ),
    );
  }
}
