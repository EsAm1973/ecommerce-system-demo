abstract class User {
  String _username;
  String _password;
  String _email;
  User(
    this._username,
    this._password,
    this._email,
  );
  //setters
  set setPasword(String newPass) => _password = newPass;
  //getters
  get username => _username;
  get password => _password;
  get email => _email;
  
  //display details of user
  void displayDetails() {
    print('Username: $_username');
    print('Password: $_password');
    print('Email: $_email');
  }

  //Abstract Method
  void resetPassword(String newPassword);
}
