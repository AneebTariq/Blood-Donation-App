import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  var email = '';
  var password = '';
  String? name = '';
  String? number = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    namecontroller = TextEditingController();
    numbercontroller = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    namecontroller.dispose();
    numbercontroller.dispose();
  }

  String? validateName(String value) {
    if (!GetUtils.isUsername(value)) {
      return "Provide valid Name";
    }
    return null;
  }

  String? validateNumber(String value) {
    if (!GetUtils.isPhoneNumber(value)) {
      return "Provide valid Number";
    }
    return null;
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
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
  }
}
