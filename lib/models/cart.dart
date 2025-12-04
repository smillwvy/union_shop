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

/// Simple global cart state using top-level helpers.
final List<CartItem> cartItems = [];

List<CartItem> getCartItems() => List.unmodifiable(cartItems);

int cartTotalItems() => cartItems.length;

int cartTotalQuantity() =>
    cartItems.fold(0, (sum, item) => sum + item.quantity);

double cartTotalPrice() => cartItems.fold(
      0.0,
      (sum, item) => sum + item.price * item.quantity,
    );

void addToCart({
  required String id,
  required String title,
  required double price,
  required String imageUrl,
  int quantity = 1,
}) {
  if (quantity < 1) return;

  final index = cartItems.indexWhere((item) => item.id == id);
  if (index >= 0) {
    cartItems[index].quantity += quantity;
  } else {
    cartItems.add(
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

void removeOneFromCart(String id) {
  final index = cartItems.indexWhere((item) => item.id == id);
  if (index == -1) return;

  final item = cartItems[index];
  if (item.quantity > 1) {
    item.quantity -= 1;
  } else {
    cartItems.removeAt(index);
  }
}

void removeItemFromCart(String id) {
  cartItems.removeWhere((item) => item.id == id);
}

void clearCart() {
  cartItems.clear();
}
