// ignore_for_file: file_names

import 'package:assignmen_1/Screens/Accepter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../forms/donorform.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: Text(
                'Welcome To Our App ',
                style: TextStyle(
                    wordSpacing: 4,
                    fontSize: 35,
                    color: Colors.red,
                    fontStyle: FontStyle.italic),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Image.asset('assets/images/first.png'),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                fixedSize: const Size(350, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                Get.to(() => const Donor());
              },
              child: const Text(
                'Donor',
                style: TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                fixedSize: const Size(350, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                Get.to(() => const Accepter());
              },
              child: const Text(
                'Accepter',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
