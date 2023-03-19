import 'package:assignmen_1/model/methodefile.dart';
import 'package:assignmen_1/model/profilecontroller.dart';
import 'package:flutter/material.dart';

class Alldonor extends StatelessWidget {
  const Alldonor({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    final controller = Profilecontroller.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: FutureBuilder<List<UserDonor>>(
              future: controller.getalluser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (c, index) {
                          return Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: ListTile(
                                  leading:
                                      Text(snapshot.data![index].Bloodgroup),
                                  title: Text(snapshot.data![index].Name),
                                  subtitle: Text(snapshot.data![index].Number),
                                  trailing: Text(snapshot.data![index].City +
                                      snapshot.data![index].Area),
                                ),
                              ),
                            ],
                          );
                        });
                  }
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Center(
                    child: Text('something went wrong'),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ),
    );
  }
}
