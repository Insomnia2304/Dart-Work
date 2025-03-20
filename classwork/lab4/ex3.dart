class MathOps<T, G> {
  int sub(T obj1, G obj2) {
    return convert(obj1) - convert(obj2);
  }

  int prod(T obj1, G obj2) {
    return convert(obj1) * convert(obj2);
  }

  int mod(T obj1, G obj2) {
    if (convert(obj2) == 0) {
      throw ArgumentError("Mod by 0");
    }
    return convert(obj1) % convert(obj2);
  }

  int convert(dynamic obj) {
    if (obj is int) return obj;
    if (obj is double) return obj.toInt();
    if (obj is String) return int.tryParse(obj) ?? 0;
    throw ArgumentError("Unsupported type: ${obj.runtimeType}");
  }
}

void main() {
    print(MathOps().sub(10, 3.5));
    print(MathOps().prod(10, "6"));
    print(MathOps().mod("+10", 3.5));
    try {
        print(MathOps().mod(10, 0));
    }
    catch (e) {
        print(e);
    }
}
