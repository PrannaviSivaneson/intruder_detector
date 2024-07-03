import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intruder_detector/widgets/intruderCard.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FirebaseMessaging _firebaseMessaging;
  @override
  void initState() {
    super.initState();

    initialiseFBMessaging();

    _firebaseMessaging = FirebaseMessaging.instance;

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        // showDialog(
        //   context: context,
        //   builder: (_) {
        //     return AlertDialog(
        //       title: Text(notification.title ?? 'No Title'),
        //       content: SingleChildScrollView(
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text(notification.body ?? 'No Body'),
        //           ],
        //         ),
        //       ),
        //     );
        //   },
        // );
        Navigator.pushNamed(context, '/notification');
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      Navigator.pushNamed(context, '/notification');
    });
  }

  initialiseFBMessaging() async {
    final notificationSettings =
        await FirebaseMessaging.instance.requestPermission(provisional: true);
    if (kDebugMode) {
      print(notificationSettings.authorizationStatus);
    }
// For apple platforms, ensure the APNS token is available before making any FCM plugin API calls
    final fcmToken = await FirebaseMessaging.instance.getToken();

    if (fcmToken != null) {
      if (kDebugMode) {
        print("fcm token : $fcmToken");
      }
      // APNS token is available, make FCM plugin API requests...
    } else {
      print("not available");
    }
  }

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
