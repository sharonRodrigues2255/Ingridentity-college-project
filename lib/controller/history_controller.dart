import 'package:college_project/model/history_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HistoryController {
  static final mydb = Hive.box<HistoryModel>("HISTORY");
  static List<HistoryModel> historyList = [];

  static addToHistory(HistoryModel value) {
    mydb.put(value.id, value);
    loadHistory();
  }

  static loadHistory() {
    historyList.clear();
    final values = mydb.values;
    historyList.addAll(values);
    print(
        "?????????????????/////// $historyList ?//////////////////////////////////////////////");
  }
}
