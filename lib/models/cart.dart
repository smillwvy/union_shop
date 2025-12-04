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

final List<CartItem> cartItems = [];

List<CartItem> getCartItems() => List.unmodifiable(cartItems);

// How many unique items are in the cart (not counting quantities).
int cartTotalItems() => cartItems.length;

// Total number of units across all items.
int cartTotalQuantity() =>
    cartItems.fold(0, (sum, item) => sum + item.quantity);

// Total price across all items (price * quantity).
double cartTotalPrice() => cartItems.fold(
      0.0,
      (sum, item) => sum + item.price * item.quantity,
    );

// Add a product or increase quantity if it already exists.
void addItem({
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

// Remove a single unit; drop the item if it reaches zero.
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

// Remove the entire item regardless of quantity.
void removeItemFromCart(String id) {
  cartItems.removeWhere((item) => item.id == id);
}

// Empty the cart.
void clearCart() {
  cartItems.clear();
}
