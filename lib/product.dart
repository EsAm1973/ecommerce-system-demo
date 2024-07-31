class Product {
  String _id;
  String _name;
  String _description;
  double _price;
  Product(this._id, this._name, this._description, this._price);
  //getters
  get id => _id;
  get name => _name;
  get price => _price;
  void displayProductDetails() {
    print('ID: $_id');
    print('Name: $_name');
    print('Description: $_description');
    print('Price: $_price');
  }
}
