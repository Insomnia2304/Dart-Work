class Client {
    final String _name;
    double _purchasesAmount = 0.0;

    Client(this._name);

    double get purchasesAmount => _purchasesAmount;
    void addPurchase(double amount) {
        _purchasesAmount += amount;
    }

    String get name => _name;
}

class LoyalClient extends Client {
    double _loyalPurchasesAmount = 0.0;

    LoyalClient(String name) : super(name);

    double get loyalPurchasesAmount => _loyalPurchasesAmount;

    void applyDiscount() {
        _loyalPurchasesAmount = super.purchasesAmount * 0.9;
    }
}

void main() {
    Client c = Client("Tom");
    c.addPurchase(100);
    print("Client ${c.name} total purchases: ${c.purchasesAmount}");

    LoyalClient lc = LoyalClient("Tom Loyal");
    lc.addPurchase(500);
    lc.applyDiscount();
    print("Loyal Client ${lc.name} total purchases after discount: ${lc.loyalPurchasesAmount}");
}
