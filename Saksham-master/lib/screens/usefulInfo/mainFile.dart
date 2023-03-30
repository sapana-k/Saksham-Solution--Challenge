import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saksham/screens/map/mapBackend.dart';
import 'package:saksham/screens/usefulInfo/RTI.dart';
import 'package:saksham/screens/usefulInfo/govSchemes.dart';
import 'package:saksham/screens/usefulInfo/ngos.dart';
import 'package:saksham/screens/usefulInfo/socialGatherings.dart';
import 'package:saksham/screens/usefulInfo/transportFacilities.dart';
import '../../constants/modifiedCards.dart';
import '../../constants/const.dart';
import '../social networking/findFriends.dart';
import 'insuranceSchemes.dart';

class MainFile extends StatefulWidget {
  const MainFile({Key? key}) : super(key: key);
  static const String id = 'MainFile';
  @override
  State<MainFile> createState() => _MainFileState();
}

class _MainFileState extends State<MainFile> {
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
    // if(_selectedIndex==3){
    //   Navigator.pushNamed(context, .id);
    // }
  }

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
        title: Text('Useful Information'),
        backgroundColor: color1,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Transport.id);
                      },
                      child: RoundCards(
                          icon: Icons.emoji_transportation,
                          text: 'Transport Facilites'),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, GovSchemesPage.id);
                        },
                        child: RoundCards(
                            icon: Icons.description,
                            text: 'Gov. schemes for PWD')),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, NGOPage.id);
                          },
                          child: RoundCards(
                              icon: Icons.favorite, text: 'NGOs support'))),
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, InsuranceSchemePage.id);
                        },
                        child: RoundCards(
                            icon: Icons.health_and_safety,
                            text: 'Insurance schemes for PWD')),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, SocialGatheringPage.id);
                        },
                        child: RoundCards(
                            icon: Icons.group,
                            text: 'Social Gatherings for PWD')),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RTIPage.id);
                      },
                      child: RoundCards(
                          icon: Icons.contact_page,
                          text: 'Right To Information for PWD'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
