// ignore_for_file: file_names
import 'package:assignmen_1/Screens/Accepter/accepter_history.dart';
import 'package:assignmen_1/Screens/Accepter/accepter_notification.dart';
import 'package:assignmen_1/Screens/Accepter/searchscreen.dart';
import 'package:assignmen_1/Screens/donor/donorsplash.dart';
import 'package:assignmen_1/shared_pref/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_model.dart';

class AccepterHome extends StatefulWidget {
  const AccepterHome({super.key});

  @override
  State<StatefulWidget> createState() {
    return Accepterhomestate();
  }
}

class Accepterhomestate extends State {
  String myString = '';

  @override
  void initState() {
    super.initState();
  }

  Future<SharedPreferences> getSharedPreferencesInstance() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> getData() async {
    SharedPreferences prefs = await getSharedPreferencesInstance();
    myString = prefs.getString('donoremail') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
              accountName: Text(''),
              accountEmail: Text(' '),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text(
                ' D o n o r ',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Get.offAll(() => const DonorSplashScreen());
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications_active),
              title: const Text(
                ' R e q u e s t s ',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Get.to(() => const Accepternotification());
              },
            ),
            ListTile(
              leading: const Icon(Icons.message_outlined),
              title: const Text(
                ' H i s t o r y ',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Get.to(() => const Accepterhistory());
              },
            ),
          ],
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
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                ' Search Donor',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
