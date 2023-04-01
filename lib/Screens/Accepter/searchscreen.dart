import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../notification.dart';

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
  final TextEditingController _bloodController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();

  NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();
    notificationServices.getDeviceToken().then((value) {
      if (kDebugMode) {
        print('device token');
        print(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Search Donor"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _bloodController,
            decoration: const InputDecoration(
              hintText: "Blood Group..",
            ),
          ),
          TextField(
            controller: _cityController,
            decoration: const InputDecoration(
              hintText: "Enter City name..",
            ),
          ),
          TextField(
            controller: _areaController,
            decoration: const InputDecoration(
              hintText: "Enter Area..",
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              _searchdonor();
            },
            child: const Text("Search"),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _getStream(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (BuildContext context, int index) {
                    QueryDocumentSnapshot document = documents[index];
                    bool isselected = false;
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(document["Blood Group"]),
                              subtitle: Text(document["City"]),
                              trailing: Text(document["Area"]),
                            ),
                            ChoiceChip(
                                tooltip: 'Request Donor For Donat of Blood',
                                backgroundColor: Colors.red,
                                label: const Text(
                                  'R e q u e st',
                                  style: TextStyle(color: Colors.white),
                                ),
                                selected: isselected,
                                onSelected: (newvalue) {
                                  notificationServices
                                      .getDeviceToken()
                                      .then((value) async {
                                    var data = {
                                      'to': value.toString(),
                                      'priority': 'high',
                                      'android': {
                                        'notification': {
                                          'title': 'Aneeb',
                                          'body': 'Donor request',
                                          'android_channel_id': "Messages",
                                          'count': 10,
                                          'notification_count': 12,
                                          'badge': 12,
                                          "click_action": 'Aneeb',
                                          'color': '#eeeeee',
                                        },
                                      },
                                      'data': {
                                        'type': 'hello',
                                        'id': 'aneeb',
                                      }
                                    };
                                    await http.post(
                                        Uri.parse(
                                            'https://fcm.googleapis.com/fcm/send'),
                                        body: jsonEncode(data),
                                        headers: {
                                          'Content-Type':
                                              'application/json; charset=UTF-8',
                                          'Authorization':
                                              'key=AAAAVf0uS9M:APA91bHbkInRG41WKCxqt_HWsCirMPcRfy2-Tnbx5Sy3a-SGnW32pbhcuCbVsn1-eIm85HdS9s-xYKlMLgn8TbIq170YvPnf_IALHA3dysxRokIJD5yKj90X-ZuxecZKTahFN_7lUcjp'
                                        });
                                  });
                                  setState(() {
                                    isselected = newvalue;
                                  });
                                })
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Stream<QuerySnapshot> _getStream() {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("Donor");
    Query query = collectionReference;

    String blood = _bloodController.text.trim();
    String city = _cityController.text.trim();
    String area = _areaController.text.trim();

    if (blood.isNotEmpty) {
      query = query.where("Blood Group", isEqualTo: blood);
    }

    if (city.isNotEmpty) {
      query = query.where("City", isEqualTo: city);
    }

    if (area.isNotEmpty) {
      query = query.where("Area", isEqualTo: area);
    }

    return query.snapshots();
  }

  void _searchdonor() {
    setState(() {});
  }
}
