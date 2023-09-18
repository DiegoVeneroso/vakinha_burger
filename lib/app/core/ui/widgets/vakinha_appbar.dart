import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/services/auth_service.dart';

class VakinhaAppbar extends AppBar {
  VakinhaAppbar({
    Key? key,
    double elevation = 2,
  }) : super(
          key: key,
          backgroundColor: Colors.white,
          elevation: elevation,
          centerTitle: true,
          title: Row(
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 80,
              ),
              Text(
                "${Get.find<AuthService>().firebaseUser.value?.email}",
                style: const TextStyle(color: Colors.black, fontSize: 10),
              ),
              TextButton(
                onPressed: () {
                  Get.find<AuthService>().logout();
                },
                child: Text('Sair'),
              ),
            ],
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        );
}
