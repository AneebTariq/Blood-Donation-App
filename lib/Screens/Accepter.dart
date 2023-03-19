// ignore_for_file: file_names

import 'package:assignmen_1/Screens/alldonorlist.dart';
import 'package:flutter/material.dart';

class Accepter extends StatelessWidget {
  const Accepter({super.key});
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accepter'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 120,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    obscureText: true,
                    decoration: InputDecoration(
                      // contentPadding: const EdgeInsets.symmetric(
                      //     vertical: 10, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      hintStyle: const TextStyle(color: Colors.red, fontSize: 13),
                      hintText: 'blood group',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 140,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    obscureText: true,
                    decoration: InputDecoration(
                      // contentPadding:
                      //     const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      hintStyle: const TextStyle(color: Colors.red),
                      hintText: 'City',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 120,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    obscureText: true,
                    decoration: InputDecoration(
                      // contentPadding: const EdgeInsets.symmetric(
                      //     vertical: 10, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      hintStyle: const TextStyle(color: Colors.red, fontSize: 13),
                      hintText: 'Area',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1,
              color: Colors.red,
            ),
            Container(
                height: MediaQuery.of(context).size.height*0.7,
                child: const Alldonor()),
          ],
        ),
      ),
    );
  }
}
