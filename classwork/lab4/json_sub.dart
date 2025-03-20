import 'dart:convert';
import 'dart:io';

Map<String, dynamic> jsonSubJson(String jsonPath1, String jsonPath2) {
  final File file1 = File(jsonPath1);
  final File file2 = File(jsonPath2);

  if (!file1.existsSync() || !file2.existsSync()) {
    throw Exception('Invalid file(s).');
  }

  Map<String, dynamic> json1 = jsonDecode(file1.readAsStringSync());
  Map<String, dynamic> json2 = jsonDecode(file2.readAsStringSync());
  return subJSONs(json1, json2);
}

Map<String, dynamic> subJSONs(Map<String, dynamic> json1, Map<String, dynamic> json2) {
  Map<String, dynamic> result = {};

  json1.forEach((key, value) {
    if (!json2.containsKey(key)) {
      result[key] = value;
    } 
    else if (value is Map<String, dynamic> && json2[key] is Map<String, dynamic>) {
      var subtracted = subJSONs(value, json2[key]);
      if (subtracted.isNotEmpty) {
        result[key] = subtracted;
      }
    } 
    else if (value is List && json2[key] is List) {
      var resList = subLists(value, json2[key]);
      if (resList.isNotEmpty) {
        result[key] = resList;
      }
    }
  });

  return result;
}

List<dynamic> subLists(List<dynamic> list1, List<dynamic> list2) {
  List<dynamic> result = List.from(list1);
  for (var item in list2) {
    result.remove(item);
  }
  return result;
}
