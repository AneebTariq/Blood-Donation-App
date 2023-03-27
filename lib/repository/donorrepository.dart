import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:assignmen_1/model/methodefile.dart';
import 'package:get/get.dart';
import '../Screens/donor/donorhome.dart';

class Donorrepository extends GetxController {
  static Donorrepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  // ignore: non_constant_identifier_names
  CreateDonor(UserDonor donor) async {
    await _db.collection('Donor').add(donor.tojason()).whenComplete(() {
      Get.snackbar(
        'Success',
        'your form saved',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      Get.off(() => const DonorHome());
    }).catchError((error, stackTrace) {
      Get.snackbar(
        'Error',
        'Someting went wrong. Try Again',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      // ignore: avoid_print
      print(error.toString());
    });
  }

// tofetch all user data
  Future<List<UserDonor>> alluser() async {
    final snapshot = await _db.collection('Donor').get();
    final userdata =
        snapshot.docs.map((e) => UserDonor.fromSnapshot(e)).toList();
    return userdata;
  }

  //fetch data of one user
  Future<UserDonor> getuserdetail(String name) async {
    final snapshot =
        await _db.collection('Donor').where('Name', isEqualTo: name).get();
    final userdata = snapshot.docs.map((e) => UserDonor.fromSnapshot(e)).single;
    return userdata;
  }
}
