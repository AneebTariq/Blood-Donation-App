import 'package:cloud_firestore/cloud_firestore.dart';

class UserRequest {
  final String? id;
  final String AccepName;
  final String Address;
  final String Donorid;

  const UserRequest({
    this.id,
    required this.AccepName,
    required this.Address,
    required this.Donorid,
  });
  tojason() {
    return {
      'AccepName': AccepName,
      'Address': Address,
      'Donorid': Donorid,
    };
  }

  factory UserRequest.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserRequest(
      id: document.id,
      AccepName: data['AccepName'],
      Address: data['Address'],
      Donorid: data['Donorid'],
    );
  }
}
