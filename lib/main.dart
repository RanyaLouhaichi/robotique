import 'package:flutter/material.dart';
import 'package:robo/Vues/Bottom.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:robo/Vues/comp%C3%A9tition/addCompetition.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

Future main() async {

  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
    runApp(MyApp());
 // await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = HexColor('#E2AC0D');

    final Color accentColor = HexColor("#000000");
    return MaterialApp(
        theme: ThemeData(
            primaryColor: primaryColor,
            fontFamily: 'Raleway',
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: accentColor)),
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          body: BottomPage(),
        ));
  }
}
