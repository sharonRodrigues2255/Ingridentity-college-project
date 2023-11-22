import 'package:hive_flutter/hive_flutter.dart';

class AlergyController {
  var alergydb = Hive.box("ALERGIES");

  addAlergies(String alergy) {
    alergydb.put(alergy, alergy);
  }

  removeAlergies(String alergy) {
    alergydb.delete(alergy);
  }
}
