// ignore_for_file: avoid_print, avoid_types_as_parameter_names
import 'package:assignmen_1/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared_pref/accepter_sharedpref.dart';
import 'accepterhome.dart';
import 'accpterregister.dart';

class AccepterLogin extends StatefulWidget {
  const AccepterLogin({super.key});

  @override
  State<StatefulWidget> createState() {
    return Accepterloginstate();
  }
}

class Accepterloginstate extends State {
  // ignore: prefer_typing_uninitialized_variables
  var passwordobs;

  @override
  void initState() {
    super.initState();
    passwordobs = true;
  }

  final formKey = GlobalKey<FormState>();
  //key for form
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement
    String accepteremail = '', accepterpassword = '';
    // ignore: no_leading_underscores_for_local_identifiers
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Image.asset(
                  'assets/images/donate.png',
                  height: 300,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  onChanged: (value) {
                    accepteremail = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  focusNode: FocusNode(),
                  autofocus: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    hintText: 'Your Email',
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.person,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  validator: (value) => value!.isEmpty ? 'Enter Email' : null,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  onChanged: (value) {
                    accepterpassword = value;
                  },
                  keyboardType: TextInputType.name,
                  obscureText: passwordobs,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    hintText: 'Password',
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordobs = !passwordobs;
                          });
                        },
                        icon: passwordobs
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      ),
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.lock,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Enter password' : null,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    fixedSize: const Size(350, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () async {
                    try {
                      // ignore: unused_local_variable
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: accepteremail,
                        password: accepterpassword,
                      );
                      await SharedPrefaccClient().setUseraccepter(
                          AccepterUserModel(
                              credential.user!.uid, credential.user!.email!));
                      Get.offAll(() => const AccepterHome());
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        Get.snackbar(
                            'Wrong', ' Please Enter Correct Email/Password ',
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM);
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                        Get.snackbar(
                            'Wrong Password', ' Enter Correct Password ',
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 25),
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Do not have account?'),
                  TextButton(
                    onPressed: () {
                      Get.to(const AccepterRegister());
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
