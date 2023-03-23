import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _SearchScreenState();
  }
}

class _SearchScreenState extends State {
  String query = '';
  String query1 = '';
  String query2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
          backgroundColor: Colors.red,
        ),
        body: Column(children: [
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 100,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        query = value;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      hintStyle: const TextStyle(color: Colors.red),
                      hintText: 'Blood Group...',
                    ),
                  ),
                ),
              ),
              // City search field
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 120,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        query1 = value;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      hintStyle: const TextStyle(color: Colors.red),
                      hintText: 'City...',
                    ),
                  ),
                ),
              ),
              // Area Search Field
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 120,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        query2 = value;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      hintStyle: const TextStyle(color: Colors.red),
                      hintText: 'Area...',
                    ),
                  ),
                ),
              ),
            ],
          ),
          // data search from firestor
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Donor')
                .where('Blood Group', isEqualTo: query)
                .where('City', isEqualTo: query1)
                .where('Area', isEqualTo: query2)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {

                log("error in snapshot");
                return Text('Error: ${snapshot.error}');
              }

              if (!snapshot.hasData) {
                return const Text('No data');
              }

              List<DocumentSnapshot> docs = snapshot.data!.docs;
              log("${docs.length}");

              return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot doc = docs[index];
                  // data shown in List Tile
                  return ListTile(
                    title: Text(doc['Blood Group']),
                    leading: Text(doc['Name']),
                    trailing: Text(doc['Number']),
                    subtitle: Text(doc['City'] + ',' + doc['Area']),
                  );
                },
              );
            },
          ))
        ]));
  }
}
