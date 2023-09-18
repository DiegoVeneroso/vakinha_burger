import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/repositories/pauta/pauta_repository.dart';
import 'package:vakinha_burger_mobile/app/repositories/pauta/pauta_repository_impl.dart';
import './home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(pautaRepositoryImpl: PautaRepositoryImpl()));
  }
}
