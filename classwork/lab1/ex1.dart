bool isPrime(int n) {
    if (n < 2) return false;
    for (int i = 2; i * i <= n; i++) {
        if (n % i == 0) return false;
    }
    return true;
}

void main() {
    for (int cnt = 0, n = 0; cnt < 100; n++) {
        if (isPrime(n)) {
            print(n);
            cnt++;
        }
    }
}