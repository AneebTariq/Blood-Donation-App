// ignore_for_file: non_constant_identifier_names

import 'package:assignmen_1/Screens/Accepter/searchscreen.dart';
import 'package:assignmen_1/model/accepter_request_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../repository/request_repository.dart';
import 'accepterhome.dart';

class Requesttodonor extends StatefulWidget {
  const Requesttodonor({super.key});

  @override
  State<StatefulWidget> createState() {
    return Requesttodonorstate();
  }
}

class Requesttodonorstate extends State {
  TextEditingController AccepName = TextEditingController();
  TextEditingController Address = TextEditingController();

  final args = Get.arguments as MyPageArguments;
  String myString = '';
// SharedPreferences prefs = await SharedPreferences.getInstance();

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
    myString = prefs.getString('accepteremail') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String myaccepemail = myString;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request to Donor'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('email:${args.donorid}'),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: AccepName,
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
                  hintText: 'Enter Your Name',
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
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: Address,
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
                  hintText: 'Enter your Address Where you want dontation',
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
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    fixedSize: const Size(350, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () async {
                    final acceptrequest = UserRequest(
                      AccepName: AccepName.text,
                      Address: Address.text,
                      Donorid: args.donorid,
                      Accepterid: myaccepemail,
                      Status: false,
                    );
                    await Requestrepository().CreateDonor(acceptrequest);
                    Get.offAll(() => const AccepterHome());
                  },
                  child: const Text(
                    ' R e q u e s t ',
                    style: TextStyle(fontSize: 25),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
