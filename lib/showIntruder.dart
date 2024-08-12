import 'package:cloud_firestore/cloud_firestore.dart';
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

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List?> getImageUrl() async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection('Users')
          .doc(widget.userID)
          .collection('intruders')
          .doc(widget.docID)
          .get();
      if (doc.exists) {
        return [doc['image_url'], doc['date_time']];
      } else {
        print('Document does not exist');
        return null;
      }
    } catch (e) {
      print('Error getting document: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        leading: const SizedBox(),
      ),
      body: Center(
        child: FutureBuilder<List?>(
          future: getImageUrl(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data == null) {
              return const Text('No data found');
            } else {
              print(snapshot.data);
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  Image.network(
                    snapshot.data![0],
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
                    'Detected at ${snapshot.data![1]}.',
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
              );
            }
          },
        ),
      ),
    );
  }
}
