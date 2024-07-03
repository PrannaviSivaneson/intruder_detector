import 'package:flutter/material.dart';
import 'package:intruder_detector/intruderDetails.dart';

class IntruderCard extends StatelessWidget {
  final String date;
  final String assetPath;
  final String time;

  const IntruderCard(
      {super.key,
      required this.date,
      required this.assetPath,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('You clicked me');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IntruderDetails(
              date: date,
              assetPath: assetPath,
              time: time,
            ),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
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
              Row(
                children: [
                  Image.asset(
                    assetPath,
                    width: 50,
                    height: 50,
                  ),
                  Image.asset(
                    assetPath,
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
