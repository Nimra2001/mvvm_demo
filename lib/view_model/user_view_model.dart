import 'package:flutter/cupertino.dart';
import 'package:mvvm_demo/utils/routes/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user_model.dart';

class UserViewModel with ChangeNotifier {
  //Saving User Data By shared Preferences
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    notifyListeners();
    return true;
  }

  //Get the user value using shared preferences
  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    return UserModel(
      token: token.toString(),
    );
  }

  //If user get log out we have to remove the session
  Future<bool> removeUser(BuildContext context) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove("token");
    sp.clear();
    Navigator.pushNamed(context, RoutesName.login);
    return true;
  }
}
