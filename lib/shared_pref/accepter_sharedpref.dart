import 'package:shared_preferences/shared_preferences.dart';
import '../model/user_model.dart';

class SharedPrefaccClient {
  static const accepteruserId = 'accepteruserId';
  static const accepteremail = 'accepteremail';
  static const String role = 'accepterrole';

  Future<bool> isUserLoggedInaccepter() async {
    final sharedPref = await SharedPreferences.getInstance();
    final accuserToken = sharedPref.getString(accepteruserId);
    return accuserToken != null;
  }

  Future<AccepterUserModel> getUseraccepter() async {
    final sharedPref = await SharedPreferences.getInstance();
    // ignore: unused_local_variable
    final accrole = sharedPref.getString(role);
    final id = sharedPref.getString(accepteruserId);
    final mail = sharedPref.getString(accepteremail);
    return AccepterUserModel(id!, mail!);
  }

  Future<void> setUseraccepter(AccepterUserModel user) async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString(accepteruserId, user.accepteruserId);
    await sharedPref.setString(accepteremail, user.accepteremail);
  }

  Future<void> clearUseraccepter() async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.remove(accepteruserId);
  }
}
