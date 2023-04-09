import 'package:assignmen_1/Screens/donor/donor_history.dart';
import 'package:assignmen_1/Screens/selecttype.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../notification.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String myString = '';
  bool value = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<SharedPreferences> getSharedPreferencesInstance() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> getData() async {
    SharedPreferences prefs = await getSharedPreferencesInstance();
    myString = prefs.getString('donoremail') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String mydonor = myString;

    final Query<Map<String, dynamic>> usersCollection = FirebaseFirestore
        .instance
        .collection('Donor')
        .where('Donoremail', isEqualTo: mydonor);

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.red),
              accountName: const Text('  '),
              accountEmail: Text(mydonor),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text(
                ' H o m e ',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Get.offAll(() => const Selected());
              },
            ),
            ListTile(
              leading: const Icon(Icons.message_outlined),
              title: const Text(
                ' I n c o m p l e t e ',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Get.to(() => const Donorhistory());
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications_active),
              title: const Text(
                'V i e w    R e q u e s t s ',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Get.to(() => const Donornotification());
              },
            ),
            const SizedBox(
              height: 5,
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                ' L o g o u t ',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Get.to(() => const Selected());
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Status'),
                Switch(
                    activeColor: Colors.green,
                    inactiveTrackColor: Colors.red,
                    value: value,
                    onChanged: (onchange) {
                      setState(() {
                        value = onchange;
                      });
                    })
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              bottom: 10,
            ),
            child: Container(
              width: 170.0,
              height: 170.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                  width: 6.0,
                ),
                shape: BoxShape.circle,
                image: const DecorationImage(
                  image: AssetImage('assets/images/donor.png'),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: usersCollection.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: <Widget>[
                          //                    Donor Name
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Card(
                              elevation: 15,
                              borderOnForeground: true,
                              child: ListTile(
                                leading: const Icon(Icons.person),
                                iconColor: Colors.red,
                                title: Text(
                                  snapshot.data!.docs[index]['Name'],
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //                   Donor Email
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Card(
                              elevation: 15,
                              borderOnForeground: true,
                              child: ListTile(
                                leading: const Icon(
                                  Icons.mail,
                                ),
                                iconColor: Colors.blue,
                                title: Text(
                                  snapshot.data!.docs[index]['Donoremail'],
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //               Donor Number
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Card(
                              elevation: 15,
                              borderOnForeground: true,
                              child: ListTile(
                                leading: const Icon(Icons.person_2),
                                iconColor: Colors.green,
                                title: Text(
                                  snapshot.data!.docs[index]['Number'],
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //              Donor Blood Group
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Card(
                              elevation: 15,
                              borderOnForeground: true,
                              child: ListTile(
                                leading: const Icon(Icons.bloodtype),
                                iconColor: Colors.red,
                                title: Text(
                                  snapshot.data!.docs[index]['Blood Group'],
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //              Donor City
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Card(
                              elevation: 15,
                              borderOnForeground: true,
                              child: ListTile(
                                leading: const Icon(Icons.location_city),
                                iconColor: Colors.orange,
                                title: Text(
                                  snapshot.data!.docs[index]['City'],
                                  style: const TextStyle(
                                    color: Colors.orange,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //                Donor Area
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Card(
                              elevation: 15,
                              borderOnForeground: true,
                              child: ListTile(
                                leading: const Icon(Icons.area_chart),
                                iconColor: Colors.deepOrange,
                                title: Text(
                                  snapshot.data!.docs[index]['Area'],
                                  style: const TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
