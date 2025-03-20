import 'json_sub.dart';

void main() {
  String path1 = '1.json';
  String path2 = '2.json';

  try {
    Map<String, dynamic> result = jsonSubJson(path1, path2);
    print('Result: $result');
  } catch (e) {
    print('Error: $e');
  }
}
