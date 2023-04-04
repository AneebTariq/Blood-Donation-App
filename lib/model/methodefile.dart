// model

// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class UserDonor {
  final String? id;
  final String Name;
  final String Bloodgroup;
  final String City;
  final String Area;
  final String Number;
  final String Donoremail;

  const UserDonor({
    this.id,
    required this.Name,
    required this.Bloodgroup,
    required this.City,
    required this.Area,
    required this.Number,
    required this.Donoremail,
  });
  tojason() {
    return {
      'Name': Name,
      'Number': Number,
      'Blood Group': Bloodgroup,
      'City': City,
      'Area': Area,
      'Donoremail': Donoremail,
    };
  }

  factory UserDonor.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserDonor(
      id: document.id,
      Name: data['Name'],
      Number: data['Number'],
      Bloodgroup: data['Blood Group'],
      City: data['City'],
      Area: data['Area'],
      Donoremail: data['Donoremail'],
    );
  }
}
