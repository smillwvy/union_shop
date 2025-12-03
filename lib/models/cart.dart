
class CartItem {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
  });
}

class Cart {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get totalItems => _items.length;

  int get totalQuantity =>
      _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice => _items.fold(
        0.0,
        (sum, item) => sum + item.price * item.quantity,
      );

  void addItem({
    required String id,
    required String title,
    required double price,
    required String imageUrl,
    int quantity = 1,
  }) {
    if (quantity < 1) return;

    final index = _items.indexWhere((item) => item.id == id);
    if (index >= 0) {
      _items[index].quantity += quantity;
    } else {
      _items.add(
        CartItem(
          id: id,
          title: title,
          price: price,
          imageUrl: imageUrl,
          quantity: quantity,
        ),
      );
    }
  }

  void removeOne(String id) {
    final index = _items.indexWhere((item) => item.id == id);
    if (index == -1) return;

    final item = _items[index];
    if (item.quantity > 1) {
      item.quantity -= 1;
    } else {
      _items.removeAt(index);
    }
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
  }

  void clear() {
    _items.clear();
  }
}

final cart = Cart();
