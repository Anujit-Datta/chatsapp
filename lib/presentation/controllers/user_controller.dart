import 'package:chatsapp/data/models/user_model.dart';

class UserController {
  static late User currentUser;
  static void updateUser(User user) {
    currentUser = user;
  }
  static User get user => currentUser;
}