import 'package:college_project/model/history_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HistoryController {
  static final mydb = Hive.box<HistoryModel>("HISTORY");
  static List<HistoryModel> historyList = []..sort((a, b) =>
      a.time.millisecondsSinceEpoch.compareTo(b.time.microsecondsSinceEpoch));

  static addToHistory(HistoryModel value) {
    mydb.put(value.id, value);
    loadHistory();
  }

  static loadHistory() {
    historyList.clear();
    final values = mydb.values.toList();
    historyList.addAll(values);
    historyList.sort((a, b) =>
        b.time.millisecondsSinceEpoch.compareTo(a.time.millisecondsSinceEpoch));
  }
}
