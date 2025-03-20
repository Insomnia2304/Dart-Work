double sumOfExtractedNumbers(String text) {
    RegExp regex = RegExp(r'-?\d+\.?\d*');
    double sum = 0.0;
  
    for (var match in regex.allMatches(text)) {
        sum += double.parse(match.group(0)!);
    }
  
  return sum;
}

void main() {
    String text = "aaaa 14.5 bbb +3 cccc -4. dddd -6.6";
    print(sumOfExtractedNumbers(text));
}
