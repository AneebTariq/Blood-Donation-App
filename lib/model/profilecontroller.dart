import 'package:assignmen_1/model/methodefile.dart';
import 'package:assignmen_1/repository/donorrepository.dart';
import 'package:get/get.dart';

class Profilecontroller extends GetxController {
  static Profilecontroller get instance => Get.put(Profilecontroller());
  final _donorrepo = Get.put(Donorrepository());

  Future<List<UserDonor>> getalluser() async {
    return await _donorrepo.alluser();
  }
}
