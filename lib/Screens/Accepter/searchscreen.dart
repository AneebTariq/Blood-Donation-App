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
  final TextEditingController _bloodController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();

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
                              onSelected: (newselected) {
                                setState(() {
                                  isselected = newselected;
                                });
                              },
                            )
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
