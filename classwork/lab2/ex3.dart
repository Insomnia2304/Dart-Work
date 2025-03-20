void main() {
    var l = [4, 3, 5, 1, 1, 2, 3, 1, 1, 3];
    Map<int, int> frecv = {};

    for (var x in l) {
        frecv.update(x, (value) => value + 1, ifAbsent: () => 1);
    }

    int n = 0;
    for (var v in frecv.values) {
        if (v < 2) continue;
        n += v * (v - 1) ~/ 2;
    }

    print(n);
}