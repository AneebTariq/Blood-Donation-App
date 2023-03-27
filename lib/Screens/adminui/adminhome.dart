import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AdminHomeState();
  }
}

class AdminHomeState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Page'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.lightGreen,
          ),
          child: const Text('Data needed'),
        ),
      ),
    );
  }
}
