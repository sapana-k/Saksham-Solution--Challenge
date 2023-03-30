// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saksham/screens/authentication/registration.dart';
import '../../constants/const.dart';
import '../../constants/modifiedCards.dart';
import 'login.dart';

class welcomePage extends StatefulWidget {
  static const String id = 'blank_page';
  const welcomePage({Key? key}) : super(key: key);

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  // final _auth = FirebaseAuth.instance;
  // late User loggedInUser;
  @override
  void initState() {
    super.initState();
    //getCurrentUser();
  }

  // void getCurrentUser() {
  //   try {
  //     final user = _auth.currentUser;
  //     loggedInUser = user;
  //     print(loggedInUser.email);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.values[3],
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
                  child: Image.asset('images/saksham.png')),
              Text(
                'Saksham',
                style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  color: color1,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Empowering Ability, Connecting Communities',
                style: TextStyle(
                  fontSize: 20.0,
                  color: color1,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 60.0),
              RoundedButton(
                  buttonColor: color1,
                  buttonText: 'Register',
                  toDo: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  }),
              SizedBox(height: 2.0),
              RoundedButton(
                  buttonColor: color1,
                  buttonText: 'Login',
                  toDo: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  }),
            ],
          ),
        ),
      )),
    );
  }
}
