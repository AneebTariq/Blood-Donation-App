import 'package:flutter/material.dart';
import 'acceptersscreen.dart';
import 'donorsscreen.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<StatefulWidget> createState() {
    return AdminHomeState();
  }
}

class AdminHomeState extends State {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Admin Page'),
        ),
        body: Column(
          children: const <Widget>[
            TabBar(tabs: [
              Tab(
                icon: Icon(Icons.person),
                //child: Text('Donors'),
              ),
              Tab(
                icon: Icon(Icons.person),
                // child: Text('Accepters'),
              )
            ]),
            Expanded(
              child: TabBarView(children: [
                //Accepters
                Accepters(),
                //Donors
                Donors(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
