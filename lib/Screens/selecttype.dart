import 'package:assignmen_1/Screens/adminui/adminlogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Accepter/acceptersplash.dart';
import 'donor/donorsplash.dart';

class Selected extends StatelessWidget {
  const Selected({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Donor & Accepter App',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: () {
              Get.dialog(Center(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.to(() => const AdminLogin());
                      },
                      child: const Text('Login as Admin'),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                      child: Text(
                        'About US',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Text(
                        'Our donor app is an innovative platform designed to facilitate a seamless and efficient donation process that benefits both donors and recipients. '
                        ' By leveraging advanced technology and prioritizing user experience, we have created a digital space where people can make a meaningful impact with the simple touch of a button. ',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ));
            },
            icon: const Icon(Icons.more_horiz),
          ),
        ],
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => const DonorSplashScreen());
                  },
                  child: const Text(
                    'Donor',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => const AccepterSplashScreen());
                  },
                  child: const Text(
                    'Accepter',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
