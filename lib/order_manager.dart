import 'dart:math';

import 'package:ecommerce_system/Customer.dart';
import 'package:ecommerce_system/cart.dart';
import 'package:ecommerce_system/order.dart';

class OrderManager {
  final List<Order> _orders = [];

  //Methods
  void placeOrder(Customer customer, ShoppingCart cart) {
    String orderId = 'ORD${Random().nextInt(1000)}';
    double totalAmount = cart.calculateTotal();
    DateTime orderDate = DateTime.now();
    Order order = Order(
        orderId, customer, List.from(cart.products), totalAmount, orderDate);
    _orders.add(order);
    cart.products.clear();
    print('Order placed successfully');
  }

  //getters
  List<Order> get orders => _orders;
}
