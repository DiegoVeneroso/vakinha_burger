import 'package:get/get.dart';
import './pauta_controller.dart';

class PautaBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(PautaController());
    }
}