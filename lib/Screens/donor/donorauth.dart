import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'donorlogin.dart';
import 'donorregister.dart';

class DonorAuth extends StatefulWidget {
  const DonorAuth({super.key});

  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return Authstate();
  }
}

class Authstate extends State {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/blood_donation.png'),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  fixedSize: const Size(350, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () async {
                  Get.to(() => const DonorLogin());
                },
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 25),
                ),
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
                Get.to(() => const DonorRegister());
              },
              child: const Text(
                'Register',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
