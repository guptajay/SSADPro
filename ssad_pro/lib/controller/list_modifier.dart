import 'dart:collection';

import 'package:ssadpro/model/student_user.dart';

class ListModifier {
  static List<String> removeStringDuplicate(List<String> list) {
    final seen = Set<String>();
    final unique = list.where((str) => seen.add(str)).toList();
    return unique;
  }
}
