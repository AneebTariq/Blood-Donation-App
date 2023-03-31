// ignore_for_file: file_names

import 'package:assignmen_1/Screens/Accepter/searchscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../selecttype.dart';

class AccepterHome extends StatelessWidget {
  const AccepterHome({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(
        child: Center(
          child: GestureDetector(
            child: const Text(
              'Go to Donor',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Get.off(() => const Selected());
            },
          ),
        ),
      ),
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
                Get.to(() => const SearchScreen());
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
