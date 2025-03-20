List<String> findMatches(String input, List<RegExp> patterns) {
  List<String> matches = [];
  
  for (RegExp pattern in patterns) {
    Iterable<Match> matchResults = pattern.allMatches(input);
    for (Match match in matchResults) {
      matches.add(match.group(0)!);
    }
  }

  return matches.toList();
}

void main() {
  String text = "The quick brown fox jumps over the lazy dog. 12345";
  List<RegExp> patterns = [
    RegExp(r'\b\w{4}\b'),
    RegExp(r'\d+')
  ];
  
  List<String> results = findMatches(text, patterns);
  print(results);
}
