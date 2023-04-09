import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeControlleracc extends GetxController {
  final GlobalKey<FormState> accloginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> accregisterFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> donorloginFormKey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController;
  TextEditingController accemailController = TextEditingController();
  TextEditingController accpasswordController = TextEditingController();
  TextEditingController donoremailController = TextEditingController();
  TextEditingController donorpasswordController = TextEditingController();

  var email = '';
  var password = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    // accemailController = TextEditingController();
    // accpasswordController = TextEditingController();

    // donoremailController = TextEditingController();
    // donorpasswordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    accemailController.dispose();
    accpasswordController.dispose();
    donoremailController.dispose();
    donorpasswordController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  void checkLogin() {
    final isValid = accloginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    accloginFormKey.currentState!.save();
  }

  void checkregister() {
    final isValid = accregisterFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    accregisterFormKey.currentState!.save();
  }

  void checkdonorLogin() {
    final isValid = donorloginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    donorloginFormKey.currentState!.save();
  }
}
