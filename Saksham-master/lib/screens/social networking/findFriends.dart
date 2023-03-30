import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saksham/constants/userCard.dart';
//import '../../constants/modifiedCards.dart';
import '../../constants/const.dart';
import '../map/mapBackend.dart';
import '../usefulInfo/mainFile.dart';
//import '../map/mapFrontend.dart';

class FindFriends extends StatefulWidget {
  const FindFriends({Key? key}) : super(key: key);
  static const String id = 'findfriends_screen';
  @override
  State<FindFriends> createState() => _FindFriendsState();
}

class _FindFriendsState extends State<FindFriends> {
  late final String gender;
  late final String name;
  late final int age;
  late final String occupation;

  @override
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Maps',
      style: optionStyle,
    ),
    Text(
      'Index 1: Find Friends',
      style: optionStyle,
    ),
    Text(
      'Index 2: information',
      style: optionStyle,
    ),
    Text(
      'Index 3: profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      Navigator.pushNamed(context, MapPage2.id);
    }
    if (_selectedIndex == 1) {
      Navigator.pushNamed(context, FindFriends.id);
    }
    if (_selectedIndex == 2) {
      Navigator.pushNamed(context, MainFile.id);
    }
  }

  final _firestore = FirebaseFirestore.instance;
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: color1,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.place,
            ),
            label: 'Maps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_add),
            label: 'Find Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Information',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: color2,
        onTap: _onItemTapped,
      ),
      backgroundColor: backgroundcolor1,
      appBar: AppBar(
        title: Text('Find Friends'),
        backgroundColor: color1,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 18.0),
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              StreamBuilder(
                  stream: _firestore.collection('User').snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    final allUsers = snapshot.data?.docs;
                    if (allUsers != null) {
                      List<UserCard> jobs = [];
                      for (var j in allUsers) {
                        jobs.add(UserCard(
                          name: j['name'],
                          gender: j['gender'],
                          age: j['age'],
                          occupation: j['occupation'],
                        ));
                      }
                      return Column(
                        children: jobs,
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: color1,
                        ),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
