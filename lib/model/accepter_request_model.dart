// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class UserRequest {
  final String? id;
  final String AccepName;
  final String Address;
  final String Donorid;
  final String Accepterid;
  final bool Status;

  const UserRequest({
    this.id,
    required this.AccepName,
    required this.Address,
    required this.Donorid,
    required this.Accepterid,
    required this.Status,
  });
  tojason() {
    return {
      'AccepName': AccepName,
      'Address': Address,
      'Donorid': Donorid,
      'Accepterid': Accepterid,
      'Status': Status,
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
        Accepterid: data['Accepterid'],
        Status: data['Status']);
  }
}
