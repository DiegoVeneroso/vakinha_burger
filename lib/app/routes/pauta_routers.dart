import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/modules/pauta/pauta_bindings.dart';
import 'package:vakinha_burger_mobile/app/modules/pauta/pauta_page.dart';

class PautaRouters {
  PautaRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/pauta',
      binding: PautaBindings(),
      page: () => PautaPage(),
    ),
  ];
}
