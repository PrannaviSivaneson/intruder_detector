import 'package:flutter/material.dart';
import 'package:intruder_detector/showIntruder.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key, required this.userID, required this.docID});
  final String userID;
  final String docID;

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40.0,
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'An Intruder is Detected!',
                    style: TextStyle(
                      color: Colors.deepPurple.shade900,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        print('You clicked me');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  ShowIntruder(userID: widget.userID, docID: widget.docID,)));
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
                      child: const Text('Let\'s have a look at whom'),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 2,
              child: Image(
                image: AssetImage('assets/Intruder Image.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
