import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burger_mobile/app/repositories/pauta/pauta_repository_impl.dart';
import './pauta_controller.dart';

class PautaPage extends GetView<PautaController> {
  PautaRepositoryImpl repository = PautaRepositoryImpl();

  PautaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.pauta),
      ),
      body: Text('teste'),
    );
  }
}
