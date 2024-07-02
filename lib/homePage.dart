import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intruder_detector/widgets/intruderCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> intruderList = List.generate(20, (index) {
    return {
      'date': '${index + 1}/06/2024',
      'assets': 'assets/Intruder Detected.jpeg',
      'time': '${index + 2}: 25',
    };
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Intruder Detector',
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: intruderList.length,
          itemBuilder: (context, index) {
            final item = intruderList[index];
            return IntruderCard(
              date: item['date']!,
              assetPath: item['assets']!,
              time: item['time']!,
            );
          }),
    );
  }
}
