import 'package:college_project/model/registration_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RegistrationController {
  List<UserRegModel> userCred = [];
  Box db = Hive.box('localdb');
  void SaveUserData(UserRegModel data) {
    userCred.add(data);
    print(userCred);
    updateDb();
  }

  updateDb() {
    db.put('usercred', userCred);
    print(db.get('usercred'));
  }

  loadDb() {
    final List dbData = db.get('usercred');
    userCred = dbData
        .map((e) => UserRegModel(
            email: e.email, username: e.username, password: e.password))
        .toList();
    print(userCred);
    // if (userCred != null) {
    //   return userCred;
    // } else {
    //   return null;
    // }
  }
}
