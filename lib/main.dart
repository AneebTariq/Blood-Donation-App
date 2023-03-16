import 'package:assignmen_1/Screens/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
