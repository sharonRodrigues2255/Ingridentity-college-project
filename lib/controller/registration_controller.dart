import 'package:college_project/model/registration_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RegistrationController {
  List userCred = [];
  var mydb = Hive.box('localdb');
  void SaveUserData(UserRegModel data) {
    mydb.put(data.username, data);

    loadmydb();
  }

  loadmydb() {
    userCred.clear();
    userCred.addAll(mydb.values);
  }
}
