import 'package:chatsapp/data/models/user_model.dart';

class UserController {
  static User currentUser=User(userId: '83e38d4b-9b0d-4eb6-8df5-b3ff64579658');
  static void updateUser(User user) {
    currentUser = user;
    currentUser.userId='83e38d4b-9b0d-4eb6-8df5-b3ff64579658';
  }
  static User get user => currentUser;
}