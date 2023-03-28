// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Donors extends StatefulWidget {
  const Donors({super.key});

  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return DonorsState();
  }
}

class DonorsState extends State {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donor'),
      ),
      body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('DonorLogin').snapshots(),
          // ignore: non_constant_identifier_names
          builder: (context, AsyncSnapshot<QuerySnapshot> Snapshot) {
            if (Snapshot.hasData) {
              return ListView.builder(
                  itemCount: Snapshot.data!.docs.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        color: Colors.amber.shade300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                'Email' + Snapshot.data!.docs[i]['donoremail']),
                            const SizedBox(
                              height: 20,
                            ),
                            Text('Password' +
                                Snapshot.data!.docs[i]['donorpassword']),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              const CircularProgressIndicator();
            }

            return const CircularProgressIndicator();
          }),
    );
  }
}
