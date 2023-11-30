import 'dart:convert';

import 'package:intl/intl.dart';

class AppFunctionReturn {
  static String changeToJson(value) {
    return json.encode(value);
  }

  static String changeToLocalDateTime(value) {
    return DateFormat('EEEE, dd MMMM yyyy, HH:mm', "id_ID")
        .format(DateFormat("yyyy-MM-dd HH:mm:ss").parse(value));
  }
}
