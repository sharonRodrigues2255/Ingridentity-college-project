import 'package:hive_flutter/hive_flutter.dart';
part 'registration_model.g.dart';

@HiveType(typeId: 1)
class UserRegModel {
  @HiveField(0)
  final String username;
  @HiveField(1)
  var password;

  @HiveField(2)
  final List? allegicItemsList;

  @HiveField(3)
  final List? scanHistory;

  UserRegModel(
      {required this.username,
      required this.password,
      this.scanHistory,
      this.allegicItemsList});
}
