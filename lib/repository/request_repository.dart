import 'package:assignmen_1/model/accepter_request_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Screens/Accepter/accepterhome.dart';

class Requestrepository extends GetxController {
  static Requestrepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  // ignore: non_constant_identifier_names
  CreateDonor(UserRequest donor) async {
    await _db
        .collection('AccepterRequest')
        .add(donor.tojason())
        .whenComplete(() {
      Get.snackbar(
        'Success',
        'your Request send Successfuly',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      Get.off(() => const AccepterHome());
      // ignore: body_might_complete_normally_catch_error
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
  Future<List<UserRequest>> alluser() async {
    final snapshot = await _db.collection('AccepterRequest').get();
    final userdata =
        snapshot.docs.map((e) => UserRequest.fromSnapshot(e)).toList();
    return userdata;
  }

  //fetch data of one user
  Future<UserRequest> getuserdetail(String name) async {
    final snapshot = await _db
        .collection('AccepterRequest')
        .where('Name', isEqualTo: name)
        .get();
    final userdata =
        snapshot.docs.map((e) => UserRequest.fromSnapshot(e)).single;
    return userdata;
  }
}
