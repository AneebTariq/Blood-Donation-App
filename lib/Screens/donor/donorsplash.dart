import 'dart:async';
import 'dart:io';
import 'package:assignmen_1/Screens/donor/donor_Profile.dart';
import 'package:assignmen_1/Screens/donor/donorlogin.dart';
import 'package:assignmen_1/shared_pref/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonorSplashScreen extends StatefulWidget {
  const DonorSplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<DonorSplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _afterBuild(context));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const Spacer(),
            Center(
              child: Image.asset('assets/images/blood_donation.png'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void _afterBuild(BuildContext context) => _checkInternetAndProceed(context);

  void _checkInternetAndProceed(BuildContext context) async {
    bool falgConnected = false;
    try {
      final result = await InternetAddress.lookup('example.com')
          .timeout(const Duration(seconds: 30));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        falgConnected = true;
      }
    } catch (_) {}
    if (falgConnected) {
      _checkSessionAndProceed();
      //  _checkLocationAndProceed(context);
    } else {
      // ignore: avoid_print
      print("no internet");
    }
  }

  void _checkSessionAndProceed() async {
    bool status = await SharedPrefClient().isUserLoggedIn();

    Timer(const Duration(seconds: 3), () {
      if (status) {
        Get.offAll(() => const ProfileScreen());
      } else {
        Get.offAll(() => const DonorLogin());
      }
    });
  }
}
