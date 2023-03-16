import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:assignmen_1/model/methodefile.dart';
import 'package:get/get.dart';

class Donorrepository extends GetxController {
  static Donorrepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  CreateDonor(UserDonor donor) async {
    await _db
        .collection('Donor')
        .add(donor.tojason())
        .whenComplete(
          () => Get.snackbar(
            'Success',
            'your form saved',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          ),
        )
        .catchError((error, stackTrace) {
      Get.snackbar(
        'Error',
        'Someting went wrong. Try Again',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print(error.toString());
    });
  }
}
