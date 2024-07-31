import 'package:ecommerce_system/Customer.dart';
import 'package:ecommerce_system/Product.dart';

class Order {
  String _id;
  Customer _customer;
  List<Product> products;
  double _totalAmount;
  DateTime _orderDate;
  Order(
    this._id,
    this._customer,
    this.products,
    this._totalAmount,
    this._orderDate,
  );
  
  Customer get customer => _customer;

  void displayOrderDetails() {
    print('===========================');
    print('Order ID: $_id');
    print('Customer: ${_customer.username}');
    print('Order Date: $_orderDate');
    print('Total Amount: \$${_totalAmount.toStringAsFixed(2)}');
    print('===========================');
  }
}
