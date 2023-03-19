import 'dart:io';

import 'package:assignmen_1/Screens/Home.dart';
import 'package:assignmen_1/Screens/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return MyAppstate();
  }
}

class MyAppstate extends State {
  static const String keyauth = "login";

  void initstate() {
    super.initState();
    wheretogo();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Donor App',
      home: Auth(),
    );
  }
}

void wheretogo() async {
  var sharepref = await SharedPreferences.getInstance();
  var isauth = sharepref.getBool(MyAppstate.keyauth);
  if (isauth != null) {
    if (isauth) {
      Get.offAll(() => const Home());
    } else {
      Get.to(() => const Auth());
    }
  } else {
    Get.to(() => const Auth());
  }
}
