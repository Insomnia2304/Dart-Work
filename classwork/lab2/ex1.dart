void main(List<String> argv) {
    List<int> l = argv.map(int.parse).toList();
    
    int i;
    for (i = l.length - 1; i >= 0; i--) {
        if (l[i] < 9) break;
    }

    for (int j = i + 1; j < l.length; j++) {
            l[j] = 0;
        }

    if (i != -1) {
        l[i]++;   
    }
    else {
        l.insert(0, 1);
    }

    print(l);
}