int digitsSum(int x) {
  int sum = 0;
  while (x > 0) {
    sum += x % 10;
    x ~/= 10;
  }
  return sum;
}

void main() {
  int n = 10;
  var l = List.generate((9 < n) ? 9 : n, (i) => [i + 1]);
  
  for (int i = 10; i <= n; i++) {
    l[digitsSum(i) - 1].add(i);
  }

  print(l);
}
