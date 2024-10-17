import 'package:empireone_mart/models/user_model.dart';

class UserService {
  Future<List<User>> fetchUsers() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));

    // Return a list of users
    return [
      User(name: 'John Doe', age: 28, address: '123 Main St'),
      User(name: 'Jane Smith', age: 34, address: '456 Elm St'),
      User(name: 'Alice Johnson', age: 22, address: '789 Maple Ave'),
    ];
  }
}
