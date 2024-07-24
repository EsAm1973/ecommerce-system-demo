import 'package:ecommerce_system/Product.dart';

class ShoppingCart {
  List<Product> products = [];

  //Methods
  void addCartProduct(Product product) {
    products.add(product);
    print('Product ${product.name} added to cart');
  }

  void removeCartProduct(Product product) {
    products.remove(product);
    print('Removed ${product.name} from the cart');
  }

  double calculateTotal() {
    double total = 0.0;
    for (var product in products) {
      total += product.price;
    }
    return total;
  }

  void displayCartItems() {
    if (products.isNotEmpty) {
      print('Shopping Cart Items:');
      print('===========================');
      for (var product in products) {
        print('${product.name} - \$${product.price.toStringAsFixed(2)}');
      }
      print('===========================');
    } else {
      print('Cart is empty');
    }
  }
}
