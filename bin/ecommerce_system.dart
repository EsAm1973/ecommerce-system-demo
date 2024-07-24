import 'dart:io';
import 'package:ecommerce_system/Customer.dart';
import 'package:ecommerce_system/Product.dart';
import 'package:ecommerce_system/admin.dart';
import 'package:ecommerce_system/cart.dart';
import 'package:ecommerce_system/order_manager.dart';

void main() {
  List<Product> products = [
    Product('1', 'PC', 'Gaming PC', 30000),
    Product('2', 'IPhone', 'IPhone 13 Pro', 25000),
    Product('3', 'MAC Book', 'Mac Book Pro', 50000),
  ];

  var adminCredentials = [
    Admin('admin1', '19731973', 'email@gmail.com', products),
    Admin('admin2', '123456789', 'email@gmail.com', products),
  ];

  var customers = [
    Customer('Mohamed', 'password123', 'email@gmail.com'),
    Customer('Ahmed', 'password456', 'email@gmail.com'),
  ];

  OrderManager orderManager = OrderManager();

  bool running = true;
  while (running) {
    print('Enter your username');
    String username = stdin.readLineSync()!;
    print('Enter your password');
    String password = stdin.readLineSync()!;

    Admin? admin;
    try {
      admin = adminCredentials.firstWhere(
          (admin) => admin.username == username && admin.password == password);
    } catch (e) {
      admin = null;
    }
    if (admin != null) {
      print('\nWelcome, ${admin.username} (Admin)');
      bool loggedIn = true;
      while (loggedIn) {
        print('\n Select an action');
        print('1. Add Product');
        print('2. Remove Product');
        print('3. Display All Products');
        print('4. Reset Password');
        print('5. View my Information');
        print('6. Logout');

        print('Enter your choice');
        int choice = int.parse(stdin.readLineSync()!);

        switch (choice) {
          case 1:
            print('Enter ID of product');
            String id = stdin.readLineSync()!;
            print('Enter name of product');
            String name = stdin.readLineSync()!;
            print('Enter description of product');
            String description = stdin.readLineSync()!;
            print('Enter price of product');
            double price = double.parse(stdin.readLineSync()!);

            admin.addProduct(Product(id, name, description, price));
            break;
          case 2:
            print('Enter ID of product to remove it');
            String id = stdin.readLineSync()!;
            admin.removeProduct(id);
            break;
          case 3:
            print('All Product in system:');
            admin.displayAllProduct();
            break;
          case 4:
            print('Enter new password');
            String newPassword = stdin.readLineSync()!;
            admin.resetPassword(newPassword);
            break;
          case 5:
            admin.displayDetails();
            break;
          case 6:
            print('Logged out...');
            loggedIn = false;
            break;
          default:
            print('Invalid Choice, please enter number between (1-6)');
        }
      }
    } else {
      Customer? customer;
      try {
        customer = customers.firstWhere((customer) =>
            customer.username == username && customer.password == password);
      } catch (e) {
        customer = null;
      }
      if (customer != null) {
        print('\n Welcome ${customer.username} (Customer)');
        bool loggedIn = true;

        ShoppingCart cart = ShoppingCart();
        while (loggedIn) {
          print('\n Select an action');
          print('1. Display Product details');
          print('2. Add Product to cart');
          print('3. Remove Product from cart');
          print('4. Place new order');
          print('5. View cart Item');
          print('6. View Oreder history');
          print('7. Reset Password');
          print('8. View my Information');
          print('9. Logout');

          print('Enter your choice between (1-9)');
          int choice = int.parse(stdin.readLineSync()!);

          switch (choice) {
            case 1:
              print('Enter ID of Product you want to display details for:');
              String id = stdin.readLineSync()!;
              Product? product;
              try {
                product = products.firstWhere((element) => element.id == id);
              } catch (e) {
                product = null;
              }
              if (product != null) {
                product.displayProductDetails();
              } else {
                print('Product with ID $id not found');
              }
              break;
            case 2:
              print('Enter ID of Product you want to add to cart:');
              String id = stdin.readLineSync()!;
              Product? product;
              try {
                product = products.firstWhere((element) => element.id == id);
              } catch (e) {
                product = null;
              }
              if (product != null) {
                cart.addCartProduct(product);
                print('======= Product Added =======');
              } else {
                print('Product with ID $id not found');
              }
              break;
            case 3:
              print('Enter ID of Product you want to remove from cart:');
              String id = stdin.readLineSync()!;
              Product? product;
              try {
                product = products.firstWhere((element) => element.id == id);
              } catch (e) {
                product = null;
              }
              if (product != null) {
                cart.removeCartProduct(product);
                print('======= Product Removed =======');
              } else {
                print('Product with ID $id not found');
              }
              break;
            case 4:
              orderManager.placeOrder(customer, cart);
              break;
            case 5:
              cart.displayCartItems();
              break;
            case 6:
              customer.viewOrderHistory(orderManager.orders);
              break;
            case 7:
              print('Enter new password');
              String newPassword = stdin.readLineSync()!;
              customer.resetPassword(newPassword);
              break;
            case 8:
              customer.displayDetails();
              break;
            case 9:
              print('Logged out...');
              loggedIn = false;
              break;
            default:
              print('Invalid Choice, please enter number between (1-9)');
          }
        }
      } else {
        print('Incorrect username or password, please try again');
      }
    }
    print('Do you want to exit the program? (yes/no)');
    String exitChoice = stdin.readLineSync()!;
    if (exitChoice.toLowerCase() == 'yes') {
      running = false;
    }
  }
}
