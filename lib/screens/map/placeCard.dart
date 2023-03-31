import 'dart:async';
import 'package:flutter/material.dart';

class Place {
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final double rating;

  Place({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.rating,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      name: json['name'],
      address: json['vicinity'],
      latitude: json['geometry']['location']['lat'],
      longitude: json['geometry']['location']['lng'],
      rating: json['rating'] ?? 0.0,
    );
  }
}

class PlaceCard extends StatelessWidget {
  final Place place;
  const PlaceCard(this.place);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(place.name),
        subtitle: Text(place.address),
        trailing: Text(place.rating.toString()),
      ),
    );
  }
}
