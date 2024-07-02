import 'package:flutter/material.dart';

class IntruderCard extends StatelessWidget {
  final String date;
  final String assetPath;
  final String time;
  const IntruderCard(
      {Key? key,
      required this.date,
      required this.assetPath,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: TextStyle(
                      color: Colors.deepPurple.shade900,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  time,
                  style: TextStyle(
                      color: Colors.deepPurple.shade900,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
            Image.asset(
              assetPath,
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
