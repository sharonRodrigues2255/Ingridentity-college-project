import 'package:hive_flutter/hive_flutter.dart';
part 'registration_model.g.dart';

@HiveType(typeId: 1)
class UserRegModel {
  @HiveField(0)
  final String email;
  @HiveField(1)
  final String username;
  @HiveField(2)
  var password;

  UserRegModel(
      {required this.email, required this.username, required this.password});
  @override
  String toString() {
    // TODO: implement toString
    return email.toString();
  }
}
