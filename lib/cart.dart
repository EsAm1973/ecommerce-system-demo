import 'package:ecommerce_system/Product.dart';

class ShoppingCart {
  List<Product> products = [];

  //Methods
  void addCartProduct(Product product) {
    products.add(product);
    print('Product ${product.name} added to cart');
  }

  void removeCartProduct(String productId) {
    var productToRemove =
        products.firstWhere((product) => product.id == productId);
    products.remove(productToRemove);
  }

  double calculateTotal() {
    double total = 0.0;
    for (var product in products) {
      total += product.price;
    }
    return total;
  }

  void displayCartItems() {
    print('Shopping Cart Items:');
    for (var product in products) {
      print('${product.name} - \$${product.price.toStringAsFixed(2)}');
    }
  }
}
