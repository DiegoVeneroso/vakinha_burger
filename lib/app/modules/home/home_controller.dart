import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/loader_mixin.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/messages_mixin.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/send_email_mixin.dart';
import 'package:vakinha_burger_mobile/app/models/pauta_model.dart';
import 'package:vakinha_burger_mobile/app/repositories/pauta/pauta_repository_impl.dart';

class HomeController extends GetxController
    with LoaderMixin, MessagesMixin, Send_Email_Mixin {
  PautaRepositoryImpl pautaRepository = PautaRepositoryImpl();

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  HomeController({required PautaRepositoryImpl pautaRepositoryImpl});

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  Future<void> addPautaController(PautaModel pautaModel) async {
    await pautaRepository
        .addPautaRepository(pautaModel)
        .then((value) => Get.back())
        .then((value) => _message(MessageModel(
            title: 'Sucesso',
            message: 'Pauta cadastrada com sucesso',
            type: MessageType.info)))
        .then(
          (value) => sendEmail(
              assunto: pautaModel.title,
              para: 'diegoveneroso.unipampa@gmail.com',
              mensagem: pautaModel.description),
        );
  }

  Future<void> deletePautaController(String documentId) async {
    await pautaRepository.deletePautaRepository(documentId);
  }

  Future<void> updatePautaController(
      String documentId, PautaModel pautaModel) async {
    await pautaRepository.updatePautaRepository(documentId, pautaModel);
  }
}
