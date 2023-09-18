import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/repositories/pauta/pauta_repository_impl.dart';

class PautaController extends GetxController {
  final _pauta = Rx<String>(Get.arguments);
  PautaRepositoryImpl repository = PautaRepositoryImpl();

  get pauta => _pauta.value;
}
