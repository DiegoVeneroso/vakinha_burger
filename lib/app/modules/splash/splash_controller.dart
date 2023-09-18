import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/loader_mixin.dart';

class SplashController extends GetxController with LoaderMixin {
  final _loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
  }

  void checkLogged() {
    // Get.put(() => AuthService());
    //  Get.putAsync(() => AuthService().init());
  }
}
