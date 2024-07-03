import 'package:flutter/material.dart';

class IntruderDetails extends StatelessWidget {
  final String date;
  final String assetPath;
  final String time;

  const IntruderDetails(
      {super.key,
      required this.date,
      required this.assetPath,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Intruder Details',
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Column(
              children: [
                Image.asset(
                  assetPath,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 10),
                Image.asset(
                  assetPath,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              date,
              style: TextStyle(
                color: Colors.deepPurple.shade900,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              time,
              style: TextStyle(
                color: Colors.deepPurple.shade900,
                fontSize: 17.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 200),
            TextButton(
              onPressed: () {
                print('You clicked me');
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurple.shade300,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 15.0,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                    30.0,
                  ))),
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
