import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saksham/screens/map/mapBackend.dart';
import '../../constants/const.dart';
import '../../constants/modifiedCards.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration';
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  late String name;
  late String email;
  late String gender;
  late String occupation;
  late int phone;
  late int age;

  late String password;
  bool showSpinner = false;
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  //margin: EdgeInsets.fromLTRB(2.0, 160.0, 2.0, 2.0),
                  height: 100.0,
                  child: Image.asset('images/saksham.png'),
                ),
              ),
              Text(
                'Lets get started!',
                style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: Text(
                  'Enter details to create an account ',
                  style: TextStyle(
                    color: Color(0xFF656565),
                    fontSize: 16.0,
                    //fontWeight: FontWeight.
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.name,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //Do something with the user input.
                    name = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your Name'),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        //Do something with the user input.
                        age = int.parse(value);
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your age'),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        //Do something with the user input.
                        gender = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your Gender'),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    phone = int.parse(value);
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your phone number'),
                ),
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //Do something with the user input.
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email'),
                ),
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //Do something with the user input.
                    occupation = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your occupation'),
                ),
              ),
              Expanded(
                child: TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      //Do something with the user input.
                      password = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your password')),
              ),
              Expanded(
                  child: RoundedButton(
                      toDo: () async {
                        //Implement registration functionality.
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                          _firestore.collection('User').add({
                            'name': name,
                            'age': age,
                            'phone': phone,
                            'gender': gender,
                            'email': email,
                            'occupation': occupation,
                          });
                          // getMessages();
                          Navigator.pushNamed(context, MapPage2.id);
                          setState(() {
                            showSpinner = false;
                          });
                        } catch (e) {
                          print(e);
                        }
                        print(email);
                        print(password);
                      },
                      buttonText: 'Register',
                      buttonColor: color1))
            ],
          ),
        ),
      ),
    );
  }
}
