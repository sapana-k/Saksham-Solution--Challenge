import 'package:flutter/material.dart';
import 'package:saksham/screens/map/mapBackend.dart';

import 'const.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.gender,
    required this.name,
    required this.occupation,
    required this.age,
  }) : super(key: key);

  final String gender;
  final String name;
  final int age;
  final String occupation;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 5.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.account_circle_rounded,
                            color: color1,
                            size: 45.0,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('$name',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                            Text('$occupation',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade700)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            child: Icon(
                              Icons.chat,
                              size: 32.0,
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, MapPage2.id);
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
