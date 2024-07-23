import 'package:ecommerce_system/User.dart';
import 'package:ecommerce_system/order.dart';

class Customer extends User {
  //Inherite all attribute from User calss
  Customer(super._username, super._password, super._email);

  //Methods
  viewOrderHistory(List<Order> orders) {
    if (orders.isNotEmpty) {
      for (var order in orders) {
        order.displayOrderDetails();
      }
    } else {
      print('Not found orders');
    }
  }

  @override
  void resetPassword(String newPassword) {
    if (newPassword.length > 8) {
      setPasword = newPassword;
    } else {
      print(
          'Password reset failed. Password does not meet the required criteria.');
    }
  }
}
