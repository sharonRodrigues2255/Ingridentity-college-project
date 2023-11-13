import 'package:hive_flutter/hive_flutter.dart';
part 'history_model.g.dart';

@HiveType(typeId: 2)
class HistoryModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String? scanresult;

  @HiveField(2)
  final DateTime time;

  HistoryModel(
      {required this.id, required this.scanresult, required this.time});
}
