// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, duplicate_ignore, avoid_print, unused_local_variable
import 'package:assignmen_1/model/user_model.dart';
import 'package:assignmen_1/shared_pref/shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'donorhome.dart';
import 'donorlogin.dart';

class DonorRegister extends StatelessWidget {
  const DonorRegister({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    String donoremail = '', donorpassword = '';
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Image.asset(
                'assets/images/donor.png',
                height: 300,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                // ignore: avoid_types_as_parameter_names
                validator: (Value) => Value!.isEmpty ? 'Enter Email' : null,
                onChanged: (value) {
                  donoremail = value;
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
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                validator: (Value) => Value!.isEmpty ? 'Enter password' : null,
                onChanged: (value) {
                  donorpassword = value;
                },
                keyboardType: TextInputType.name,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  hintText: 'Password',
                  suffixIcon: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.visibility,
                      color: Colors.red,
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
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: donoremail,
                      password: donorpassword,
                    );
                    await SharedPrefClient().setUser(UserModel(
                        credential.user!.uid, credential.user!.email!));
                    Get.offAll(() => const DonorHome());
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: const Text('Register')),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Allready have account?'),
                TextButton(
                  onPressed: () {
                    Get.to(const DonorLogin());
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
