import 'package:assignmen_1/model/donor_user_model.dart';
import 'package:assignmen_1/model/methodefile.dart';
import 'package:assignmen_1/shared_pref/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Screens/donor/donorhome.dart';
import '../repository/donorrepository.dart';

class Donor extends StatefulWidget {
  const Donor({super.key});

  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return Donorstate();
  }
}

class Donorstate extends State {
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
    myString = prefs.getString('donoremail') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    TextEditingController name = TextEditingController();
    TextEditingController number = TextEditingController();
    TextEditingController bloodgroup = TextEditingController();
    TextEditingController city = TextEditingController();
    TextEditingController area = TextEditingController();
    String mydonor = myString;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donor'),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Form(
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/images/donate.png',
                height: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              // Enter name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: name,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    hintStyle: const TextStyle(color: Colors.red),
                    hintText: 'name',
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              // Enter number
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: number,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    hintStyle: const TextStyle(color: Colors.red),
                    hintText: 'number',
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              // Enter Blood Group
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: bloodgroup,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    hintStyle: const TextStyle(color: Colors.red),
                    hintText: 'Blood Group',
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              //Enter city
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: city,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    hintStyle: const TextStyle(color: Colors.red),
                    hintText: 'city',
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              //area
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: area,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    hintStyle: const TextStyle(color: Colors.red),
                    hintText: 'area',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Submit Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    fixedSize: const Size(300, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () async {
                    // ignore: non_constant_identifier_names
                    final User = UserDonor(
                        Name: name.text,
                        Bloodgroup: bloodgroup.text,
                        City: city.text,
                        Area: area.text,
                        Donoremail: mydonor,
                        Number: number.text);
                    await Donorrepository().CreateDonor(User);
                    //await SharedPrefClient().getUser();
                    Get.offAll(() => const DonorHome());
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
