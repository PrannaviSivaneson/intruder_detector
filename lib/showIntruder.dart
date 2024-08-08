import 'package:flutter/material.dart';

class ShowIntruder extends StatefulWidget {
  const ShowIntruder({super.key, required this.userID, required this.docID});
  final String userID;
  final String docID;


  @override
  State<ShowIntruder> createState() => _ShowIntruderState();
}

class _ShowIntruderState extends State<ShowIntruder> {

  @override
  void initState() {
    super.initState();
  }

  getIntruder() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        leading: const SizedBox(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            const Image(
              image: AssetImage('assets/Intruder Detected.jpeg'),
              width: 250,
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 30),
            Text(
              'This is the Intruder!',
              style: TextStyle(
                color: Colors.deepPurple.shade900,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Detected at 7.05 am today.',
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
