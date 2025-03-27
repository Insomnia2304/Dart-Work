import 'dart:io';

class Stack {
  final File _fp;

  Stack(String filePath) : _fp = File(filePath);

  void push(Object value) {
    if (!_fp.existsSync()) {
        print("File ${_fp.path} was moved or deleted.");
        return;
    }
    _fp.writeAsStringSync("$value\n", mode: FileMode.append);
  }

  bool isEmpty() {
    if (!_fp.existsSync()) {
        print("File ${_fp.path} was moved or deleted.");
        return true;
    }
    return _fp.readAsLinesSync().isEmpty;
  }

  Object? pop() {
    if (!_fp.existsSync()) {
        print("File ${_fp.path} was moved or deleted.");
        return null;
    }
    if (isEmpty()) return null;
    List<String> lines = _fp.readAsLinesSync();
    Object? lastElement = lines.last;
    lines.removeLast();
    _fp.writeAsStringSync(lines.join("\n"));
    
    return lastElement;
  }

  Object? top() {
    if (!_fp.existsSync()) {
        print("File ${_fp.path} was moved or deleted.");
        return null;
    }
    if (isEmpty()) return null;
    return _fp.readAsLinesSync().last;
  }

  @override
  String toString() {
    if (!_fp.existsSync()) {
        return "File ${_fp.path} was moved or deleted.";
    }
    return "My custom stack: ${_fp.path}, ${_fp.readAsLinesSync()}";
  }
}

void main() {
  var s = Stack("stack_data.txt");
  
  print("Is empty: ${s.isEmpty()}");
  s.push(1);
  s.push(2);
  s.push(3);
  print(s);
  print("Top: ${s.top()}");
  s.push(4);
  s.push("a");
  print(s);
}
