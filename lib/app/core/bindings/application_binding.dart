import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/services/shopping_card_service.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShoppingCardService());
  }
}
