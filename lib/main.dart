import 'dart:io';
import 'package:assignmen_1/Screens/selecttype.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return MyAppstate();
  }
}

class MyAppstate extends State {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Donor App',
      home: Selected(),
    );
  }
}
