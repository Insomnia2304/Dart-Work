String UpperCamelCaseToSnakeCase(String input) {
    String snakeCaseString = "";
    for (int i = 0; i < input.length; i++) {
        if (input[i].toUpperCase() == input[i] && i > 0) {
            snakeCaseString += "_";
        }
        snakeCaseString += input[i].toLowerCase();
    }

    return snakeCaseString;
}

void main() {
    String input = "HelloWorld";
    print(UpperCamelCaseToSnakeCase(input));
}