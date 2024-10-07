import 'package:get/get.dart';

import '../utils/constants.dart';

class HomeController extends GetxController {
  int bnbIndex = 0;
  updateBnbIndex(int index) {
    bnbIndex = index;
    update();
  }

  List<String> tags = ['All', 'Unread', 'Favorites', 'Groups'];
  int tagIndex = 0;
  updateTagIndex(int index) {
    tagIndex = index;
    update();
  }

  List<List> conversationsTags = [
    all,
    unread,
    fev,
    groups,
  ];


}