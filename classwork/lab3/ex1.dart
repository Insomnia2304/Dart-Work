class Queue {
    List<Object> _q = [];

    void push(Object value) {
        _q.add(value);
    }

    bool isEmpty() => _q.isEmpty;
    Object? pop() => isEmpty() ? null : _q.removeAt(0);
    Object? front() => isEmpty() ? null : _q.first;
    Object? back() => isEmpty() ? null : _q.last;

    @override
    String toString() {
        return "My custom queue: $_q";
    }
}

void main() {
    var q = Queue();

    print("Is empty: ${q.isEmpty()}");
    q.push(1);
    q.push(2);
    q.push(3);
    print(q);
    print("Front: ${q.front()}");
    print("Back: ${q.back()}");

    q.pop();
    q.push(4);
    q.push("a");
    print(q);
}
