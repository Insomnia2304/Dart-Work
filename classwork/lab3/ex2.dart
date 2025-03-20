class Example {
    int varA;
    int varB;
    String varC;
    List<int> varD;
    double varE;

    Example({required this.varA, required this.varB, required this.varC, required this.varD, required this.varE});
    factory Example.fromXml(String xmlString) {
        final a = RegExp(r'<varA>(.*?)</varA>').firstMatch(xmlString)?.group(1);
        final b = RegExp(r'<varB>(.*?)</varB>').firstMatch(xmlString)?.group(1);
        final c = RegExp(r'<varC>(.*?)</varC>').firstMatch(xmlString)?.group(1);
        final d = RegExp(r'<varD>(.*?)</varD>').firstMatch(xmlString)?.group(1);
        final e = RegExp(r'<varE>(.*?)</varE>').firstMatch(xmlString)?.group(1);

        return Example(
            varA: int.parse(a!),
            varB: int.parse(b!),
            varC: c!,
            varD: d!.split(',').map(int.parse).toList(),
            varE: double.parse(e!),
        );
  }

  String toXml() {
    return '<Example>'
        '<varA>$varA</varA>'
        '<varB>$varB</varB>'
        '<varC>$varC</varC>'
        '<varD>${varD.join(',')}</varD>'
        '<varE>$varE</varE>'
        '</Example>';
  }
}

void main() {
    var example = Example(
        varA: 10,
        varB: 20,
        varC: 'a',
        varD: [1, 2, 3, 4, 5],
        varE: 99.99,
    );
    print(example.toXml());

    var example2 = Example.fromXml('<Example><varA>100</varA><varB>200</varB><varC>aa</varC><varD>1,2,3,4,5,6</varD><varE>999.99</varE></Example>');
    print(example2.varA);
    print(example2.varB);
    print(example2.varC);
    print(example2.varD);
    print(example2.varE);
}
