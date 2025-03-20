void main(List<String> argv) {
    Map<String, int> points = {};

    for (int i = 0; i < argv.length - 1; i += 2) {
        points[argv[i]] = int.parse(argv[i + 1]);
    }

    int sum = 0;
    for (int i = 0; i < argv.last.length; i++) {
        sum += points[argv.last[i]] ?? 0;
    }

    print(sum);
}