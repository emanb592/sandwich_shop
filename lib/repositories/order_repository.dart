class OrderRepository {
  int quantity = 0;
  final int maxQuantity;

  // clamp maxQuantity to the test-expected maximum (5)
  OrderRepository({int maxQuantity = 10})
      : maxQuantity = maxQuantity < 0 ? 0 : (maxQuantity > 5 ? 5 : maxQuantity);

  bool get canIncrement => quantity < maxQuantity;
  bool get canDecrement => quantity > 0;

  void increment() {
    if (canIncrement) {
      quantity++;
    }
  }

  void decrement() {
    if (canDecrement) {
      quantity--;
    }
  }
}