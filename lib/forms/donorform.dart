import 'package:assignmen_1/Screens/donor/donor_Profile.dart';
import 'package:assignmen_1/model/methodefile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  final formKey = GlobalKey<FormState>(); //key for form
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

  String blood = '';
  // ignore: non_constant_identifier_names
  String Area = '';
  // ignore: non_constant_identifier_names
  String City = '';
  List<String> bloodgroup = [
    'A+',
    'B+',
    'AB+',
    'O+',
    'A-',
    'B-',
    'AB-',
    'O-',
  ];
  List<String> area = [
    'Gulbark',
    'Green Town',
    'Qartba Chownk',
    'College Road',
  ];
  List<String> city = [
    'Lahore',
    'Karachi',
    'Islamabad',
  ];
  String dropdownbloodValue = 'B+';
  String dropdownareaValue = 'Qartba Chownk';
  String dropdowncityValue = 'Lahore';
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    TextEditingController name = TextEditingController();
    TextEditingController number = TextEditingController();
    //TextEditingController bloodgroup = TextEditingController();
    //TextEditingController city = TextEditingController();
    // TextEditingController area = TextEditingController();
    String mydonor = myString;
    // ignore: no_leading_underscores_for_local_identifiers
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Donor'),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
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
                height: 5,
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
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Enter Name";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
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
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[+]*[0-9]+$').hasMatch(value)) {
                      return "Enter Phone Number";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Enter Blood Group
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownbloodValue,
                  items:
                      bloodgroup.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownbloodValue = newValue ?? '';
                      blood = dropdownbloodValue;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownareaValue,
                  items: area.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownareaValue = newValue ?? '';
                      Area = dropdownareaValue;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: dropdowncityValue,
                  items: city.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdowncityValue = newValue ?? '';
                      City = dropdowncityValue;
                    });
                  },
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
                    if (formKey.currentState!.validate()) {
                      // ignore: non_constant_identifier_names
                      final User = UserDonor(
                          Name: name.text,
                          Bloodgroup: blood.toString(),
                          City: city.toString(),
                          Area: area.toString(),
                          Donoremail: mydonor,
                          Number: number.text);
                      await Donorrepository().CreateDonor(User);
                      //await SharedPrefClient().getUser();
                      Get.offAll(() => const ProfileScreen());
                    }
                  },
                  child: const Text(
                    'S a v e ',
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
