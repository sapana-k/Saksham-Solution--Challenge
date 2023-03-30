import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saksham/screens/map/locationServices.dart';

import '../../constants/const.dart';
import '../social networking/findFriends.dart';
import '../usefulInfo/mainFile.dart';

var accessible = false;

class MapPage2 extends StatefulWidget {
  @override
  static const String id = 'map2_screen';
  _MapPage2State createState() => _MapPage2State();
}

class _MapPage2State extends State<MapPage2> {
  final Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _searchcontroller = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: Text('Saksham'),
      ),
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
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('Buildings').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final allbuildings = snapshot.data?.docs;
          if (allbuildings != null) {
            for (var building in allbuildings) {
              if (building['lift'] == true ||
                  building['accessible_toilet'] == true ||
                  building['accessible_corridor'] == true ||
                  building['accessible_reception'] == true ||
                  building['accessible_parking'] == true ||
                  building['drinking_water'] == true ||
                  building['ramp_wheelchair'] == true ||
                  building['route_with_tactile'] == true ||
                  building['signage'] == true ||
                  building['staircase'] == true) {
                // setState(() {
                accessible = true;
                // });
              }
              //final building = doc.data();
              final marker = Marker(
                markerId: MarkerId(building['property_name']),
                position: LatLng(building['lat'], building['long']),
                infoWindow: InfoWindow(
                    title: accessible ? 'Accessible' : 'Not Accessible'),
                icon: accessible
                    ? BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueGreen)
                    : BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueViolet),
              );
              _markers.add(marker);
              accessible = false;
            }
          }

          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        controller: _searchcontroller,
                        textCapitalization: TextCapitalization.words,
                        decoration:
                            InputDecoration(hintText: 'Where do you wanna go?'),
                        onChanged: (value) {
                          print(value);
                        }),
                  ),
                  IconButton(
                      onPressed: () {
                        LocationService().getPlaceId(_searchcontroller.text);
                      },
                      icon: Icon(Icons.search)),
                ],
              ),
              Expanded(
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(16.84597245937883, 74.60139705985866),
                    zoom: 12,
                  ),
                  markers: _markers,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
