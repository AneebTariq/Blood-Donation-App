// ignore_for_file: file_names

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
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 100,
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
                width: 120,
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  //fixedSize: const Size(300, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Find Donor',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            thickness: 1,
            color: Colors.red,
          ),
          const Center(
            child: Text('Map Location'),
          ),
        ],
      ),
    );
  }
}
