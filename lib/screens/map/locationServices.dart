import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:saksham/screens/map/placeCard.dart';

class LocationService {
  final String key = 'AIzaSyCqalro7TJ-mLbrn0msk8_lQABX6vQ4tNI';
  var results;
  Future<Place> fetchPlaceCard() async {
    var placeId;
    var input = 'pune';
    final String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      print("yesssss");
      placeId = await data['candidates'][0]['place_id'] as String;
      print(placeId);
    } else {
      throw Exception('Failed to get nearby places');
    }
    final String url2 =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';
    var response2 = await http.get(Uri.parse(url2));
    var json = convert.jsonDecode(response2.body);
    results = json['result'] as Map<String, dynamic>;
    return Place.fromJson(results);
  }

  Card fetchCard(Map<String, dynamic> json) {
    var latitude = json['geometry']['location']['lat'];
    var longitude = json['geometry']['location']['lng'];
    return Card(
      child: ListTile(
        title: Text(json['name']),
        subtitle: Text(json['vicinity']),
        trailing: Text('$latitude and $longitude'),
      ),
    );
  }

  Future<Map<String, dynamic>> getPlace(String input) async {
    var placeId;
    final String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      print("yesssss");
      placeId = await data['candidates'][0]['place_id'] as String;
      print(placeId);
    } else {
      throw Exception('Failed to get nearby places');
    }

    final String url2 =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';
    var response2 = await http.get(Uri.parse(url2));
    var json = convert.jsonDecode(response2.body);
    var results = json['result'] as Map<String, dynamic>;
    print(results);
    return results;
  }
}
