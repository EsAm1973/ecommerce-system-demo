import 'package:ecommerce_system/Product.dart';
import 'package:ecommerce_system/User.dart';

class Admin extends User {
  List<Product> products = [];
  Admin(super._username, super._password, super._email, this.products);
  //Methods
  void addProduct(Product product) {
    products.add(product);
    print('Product ${product.name} added');
  }

  void removeProduct(String productId) {
    var productToRemove =
        products.firstWhere((product) => product.id == productId);
    products.remove(productToRemove);
    print('Product ${productToRemove.name} removed');
  }

  void displayAllProduct() {
    for (var product in products) {
      product.displayProductDetails();
      print('==========================');
    }
  }

  //Overrided Method from User Class
  @override
  void resetPassword(String newPassword) {
    if (newPassword.length > 8) {
      setPasword = newPassword;
      print('Password to $username reseted');
    } else {
      print(
          'Password reset failed. Password does not meet the required criteria.');
    }
  }
}
