import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/loader_mixin.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/messages_mixin.dart';
import 'package:vakinha_burger_mobile/app/repositories/auth/auth_repository.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  LoginController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  Future<void> login({required String email, required String password}) async {
    _loading.toggle();
    final result = await _authRepository.login(email, password);
    String message = '';
    print('fdsafasdfsadfasfasfd');
    print(result);
    switch (result) {
      case 'app-deleted':
        message = 'O banco de dados não foi localizado.';
        break;
      case 'expired-action-code':
        message = 'O código da ação o ou link expirou.';
        break;
      case 'invalid-action-code':
        message =
            'O código da ação é inválido. Isso pode acontecer se o código estiver malformado ou já tiver sido usado.';
        break;
      case 'user-disabled':
        message =
            'O usuário correspondente à credencial fornecida foi desativado.';
        break;
      case 'user-not-found':
        message = 'O usuário não correponde à nenhuma credencial.';
        break;
      case 'weak-password':
        message = 'A senha é muito fraca.';
        break;
      case 'email-already-in-use':
        message = 'Já existi uma conta com o endereço de email fornecido.';
        break;
      case 'invalid-email':
        message = 'O endereço de e-mail não é válido.';
        break;
      case 'operation-not-allowed':
        message =
            'O tipo de conta correspondente à esta credencial, ainda não encontra-se ativada.';
        break;
      case 'account-exists-with-different-credential':
        message = 'E-mail já associado a outra conta.';
        break;
      case 'auth-domain-config-required':
        message = 'A configuração para autenticação não foi fornecida.';
        break;
      case 'credential-already-in-use':
        message = 'Já existe uma conta para esta credencial.';
        break;
      case 'operation-not-supported-in-this-environment':
        message =
            'Esta operação não é suportada no ambiente que está sendo executada. Verifique se deve ser http ou https.';
        break;
      case 'timeout':
        message =
            'Excedido o tempo de resposta. O domínio pode não estar autorizado para realizar operações.';
        break;
      case 'missing-android-pkg-name':
        message =
            'Deve ser fornecido um nome de pacote para instalação do aplicativo Android.';
        break;
      case 'missing-continue-uri':
        message = 'A próxima URL deve ser fornecida na solicitação.';
        break;
      case 'missing-ios-bundle-id':
        message =
            'Deve ser fornecido um nome de pacote para instalação do aplicativo iOS.';
        break;
      case 'invalid-continue-uri':
        message = 'A próxima URL fornecida na solicitação é inválida.';
        break;
      case 'unauthorized-continue-uri':
        message = 'O domínio da próxima URL não está na lista de autorizações.';
        break;
      case 'invalid-dynamic-link-domain':
        message =
            'O domínio de link dinâmico fornecido, não está autorizado ou configurado no projeto atual.';
        break;
      case 'argument-error':
        message = 'Verifique a configuração de link para o aplicativo.';
        break;
      case 'invalid-persistence-type':
        message =
            'O tipo especificado para a persistência dos dados é inválido.';
        break;
      case 'unsupported-persistence-type':
        message =
            'O ambiente atual não suportar o tipo especificado para persistência dos dados.';
        break;
      case 'invalid-credential':
        message = 'A credencial expirou ou está mal formada.';
        break;
      case 'wrong-password':
        message = 'Senha incorreta.';
        break;
      case 'invalid-verification-code':
        message = 'O código de verificação da credencial não é válido.';
        break;
      case 'invalid-verification-id':
        message = 'O ID de verificação da credencial não é válido.';
        break;
      case 'custom-token-mismatch':
        message = 'O token está diferente do padrão solicitado.';
        break;
      case 'invalid-custom-token':
        message = 'O token fornecido não é válido.';
        break;
      case 'captcha-check-failed':
        message =
            'O token de resposta do reCAPTCHA não é válido, expirou ou o domínio não é permitido.';
        break;
      case 'invalid-phone-number':
        message =
            'O número de telefone está em um formato inválido (padrão E.164).';
        break;
      case 'missing-phone-number':
        message = 'O número de telefone é requerido.';
        break;
      case 'quota-exceeded':
        message = 'A cota de SMS foi excedida.';
        break;
      case 'cancelled-popup-request':
        message =
            'Somente uma solicitação de janela pop-up é permitida de uma só vez.';
        break;
      case 'popup-blocked':
        message = 'A janela pop-up foi bloqueado pelo navegador.';
        break;
      case 'popup-closed-by-user':
        message =
            'A janela pop-up foi fechada pelo usuário sem concluir o login no provedor.';
        break;
      case 'unauthorized-domain':
        message =
            'O domínio do aplicativo não está autorizado para realizar operações.';
        break;
      case 'invalid-user-token':
        message = 'O usuário atual não foi identificado.';
        break;
      case 'user-token-expired':
        message = 'O token do usuário atual expirou.';
        break;
      case 'null-user':
        message = 'O usuário atual é nulo.';
        break;
      case 'app-not-authorized':
        message =
            'Aplicação não autorizada para autenticar com a chave informada.';
        break;
      case 'invalid-api-key':
        message = 'A chave da API fornecida é inválida.';
        break;
      case 'network-request-failed':
        message = 'Falha de conexão com a rede.';
        break;
      case 'requires-recent-login':
        message =
            'O último horário de acesso do usuário não atende ao limite de segurança.';
        break;
      case 'too-many-requests':
        message =
            'As solicitações foram bloqueadas devido a atividades incomuns. Tente novamente depois que algum tempo.';
        break;
      case 'web-storage-unsupported':
        message =
            'O navegador não suporta armazenamento ou se o usuário desativou este recurso.';
        break;
      case 'invalid-claims':
        message = 'Os atributos de cadastro personalizado são inválidos.';
        break;
      case 'claims-too-large':
        message =
            'O tamanho da requisição excede o tamanho máximo permitido de 1 Megabyte.';
        break;
      case 'id-token-expired':
        message = 'O token informado expirou.';
        break;
      case 'id-token-revoked':
        message = 'O token informado perdeu a validade.';
        break;
      case 'invalid-argument':
        message = 'Um argumento inválido foi fornecido a um método.';
        break;
      case 'invalid-creation-time':
        message = 'O horário da criação precisa ser uma data UTC válida.';
        break;
      case 'invalid-disabled-field':
        message = 'A propriedade para usuário desabilitado é inválida.';
        break;
      case 'invalid-display-name':
        message = 'O nome do usuário é inválido.';
        break;
      case 'invalid-email-verified':
        message = 'O e-mail é inválido.';
        break;
      case 'invalid-hash-algorithm':
        message = 'O algoritmo de HASH não é uma criptografia compatível.';
        break;
      case 'invalid-hash-block-size':
        message = 'O tamanho do bloco de HASH não é válido.';
        break;
      case 'invalid-hash-derived-key-length':
        message = 'O tamanho da chave derivada do HASH não é válido.';
        break;
      case 'invalid-hash-key':
        message = 'A chave de HASH precisa ter um buffer de byte válido.';
        break;
      case 'invalid-hash-memory-cost':
        message = 'O custo da memória HASH não é válido.';
        break;
      case 'invalid-hash-parallelization':
        message = 'O carregamento em paralelo do HASH não é válido.';
        break;
      case 'invalid-hash-rounds':
        message = 'O arredondamento de HASH não é válido.';
        break;
      case 'invalid-hash-salt-separator':
        message =
            'O campo do separador de SALT do algoritmo de geração de HASH precisa ser um buffer de byte válido.';
        break;
      case 'invalid-id-token':
        message = 'O código do token informado não é válido.';
        break;
      case 'invalid-last-sign-in-time':
        message = 'O último horário de login precisa ser uma data UTC válida.';
        break;
      case 'invalid-page-token':
        message = 'A próxima URL fornecida na solicitação é inválida.';
        break;
      case 'invalid-password':
        message = 'A senha é inválida, precisa ter pelo menos 6 caracteres.';
        break;
      case 'invalid-password-hash':
        message = 'O HASH da senha não é válida.';
        break;
      case 'invalid-password-salt':
        message = 'O SALT da senha não é válido.';
        break;
      case 'invalid-photo-url':
        message = 'A URL da foto de usuário é inválido.';
        break;
      case 'invalid-provider-id':
        message = 'O identificador de provedor não é compatível.';
        break;
      case 'invalid-session-cookie-duration':
        message =
            'A duração do COOKIE da sessão precisa ser um número válido em milissegundos, entre 5 minutos e 2 semanas.';
        break;
      case 'invalid-uid':
        message =
            'O identificador fornecido deve ter no máximo 128 caracteres.';
        break;
      case 'invalid-user-import':
        message = 'O registro do usuário a ser importado não é válido.';
        break;
      case 'invalid-provider-data':
        message = 'O provedor de dados não é válido.';
        break;
      case 'maximum-user-count-exceeded':
        message =
            'O número máximo permitido de usuários a serem importados foi excedido.';
        break;
      case 'missing-hash-algorithm':
        message =
            'É necessário fornecer o algoritmo de geração de HASH e seus parâmetros para importar usuários.';
        break;
      case 'missing-uid':
        message = 'Um identificador é necessário para a operação atual.';
        break;
      case 'reserved-claims':
        message =
            'Uma ou mais propriedades personalizadas fornecidas usaram palavras reservadas.';
        break;
      case 'session-cookie-revoked':
        message = 'O COOKIE da sessão perdeu a validade.';
        break;
      case 'uid-alread-exists':
        message = 'O indentificador fornecido já está em uso.';
        break;
      case 'email-already-exists':
        message = 'O e-mail fornecido já está em uso.';
        break;
      case 'phone-number-already-exists':
        message = 'O telefone fornecido já está em uso.';
        break;
      case 'project-not-found':
        message = 'Nenhum projeto foi encontrado.';
        break;
      case 'insufficient-permission':
        message =
            'A credencial utilizada não tem permissão para acessar o recurso solicitado.';
        break;
      case 'internal-error':
        message =
            'O servidor de autenticação encontrou um erro inesperado ao tentar processar a solicitação.';
        break;
    }
    if (message != '') {
      _loading.toggle();
      Get.snackbar(
        "Erro!",
        message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
      );
    }
  }

  Future<void> logout() async {
    _loading.toggle();
    await FirebaseAuth.instance.signOut();
    _loading.toggle();
  }
}
