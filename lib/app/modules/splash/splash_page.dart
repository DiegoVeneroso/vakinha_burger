import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burger_mobile/app/modules/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  // @override
  // void onReady() {
  //   // Future.delayed(Duration(seconds: 3), () => controller.checkLogged());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF140E0E),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.width,
                child: Image.asset(
                  'assets/images/lanche.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: context.heightTransformer(reducedBy: 85),
                  ),
                  Image.asset('assets/images/logo.png'),
                  const SizedBox(
                    height: 60,
                  ),
                  const CircularProgressIndicator(),
                  // VakinhaButton(
                  //   label: 'ACESSAR',
                  //   width: context.widthTransformer(reducedBy: 40),
                  //   height: 35,
                  //   onPressed: () => controller.checkLogged(),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
