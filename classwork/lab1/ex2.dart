void main() {
    String phrase = "Hello, World!";
    var words = phrase.split(RegExp(r"[^a-zA-Z0-9]"))
                      .where((s) => s.trim().isNotEmpty)
                      .toList();
    print(words);
}