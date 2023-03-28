import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Screens/adminui/adminhome.dart';

class Adminhelper {
  TextEditingController adminemail = TextEditingController();
  TextEditingController adminpassword = TextEditingController();

  // TextEditingController accepteremail = TextEditingController();
  // TextEditingController accepterpassword = TextEditingController();

  void adminlogin(context) async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Center(
                child: CircularProgressIndicator(),
              ),
            );
          });
      await FirebaseFirestore.instance
          .collection('Admin')
          .doc('Admin')
          .snapshots()
          .forEach((element) {
        if (element.data()?['AdminEmail'] == adminemail.text &&
            element.data()?['AdminPassword'] == adminpassword.text) {
          Get.off(() => const AdminHome());
        }
      });
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text('Error Message'),
              content: Text('Something Went Wrong'),
            );
          });
    }
  }

  // void AccepterLogin(context) async {
  //   try {
  //     showDialog(
  //         context: context,
  //         builder: (context) {
  //           return const AlertDialog(
  //             title: Center(
  //               child: CircularProgressIndicator(),
  //             ),
  //           );
  //         });
  //     await FirebaseFirestore.instance
  //         .collection('AccepterLogin')
  //         .doc('Admin')
  //         .snapshots()
  //         .forEach((element) {
  //       if (element.data()?['AdminEmail'] == adminemail.text &&
  //           element.data()?['AdminPassword'] == adminpassword.text) {
  //         Get.off(() => const AdminHome());
  //       }
  //     });
  //   } catch (e) {
  //     showDialog(
  //         context: context,
  //         builder: (context) {
  //           return const AlertDialog(
  //             title: Text('Error Message'),
  //             content: Text('Something Went Wrong'),
  //           );
  //         });
  //   }
  // }
}
