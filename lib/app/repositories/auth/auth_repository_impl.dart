import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/messages_mixin.dart';
import 'package:vakinha_burger_mobile/app/core/services/auth_service.dart';
import 'package:vakinha_burger_mobile/app/models/user_model.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final _message = Rxn<MessageModel>();

  @override
  Future<String> register(String name, String email, String password) async {
    //Autenticação Firebase
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      FirebaseFirestore.instance.collection('users').add({
        'idUser': Get.find<AuthService>().firebaseUser.value?.uid,
        'name': name,
        'urlPhoto': 'fadsfsadfasdfsad',
        'email': email,
      });
    } on FirebaseAuthException catch (e, s) {
      log('Erro ao realizar loginfdsafads', error: e, stackTrace: s);
    } catch (e) {
      print(e.toString());
    }
    return login(email, password);
  }

  @override
  Future<String> login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      print(e.toString());
    }
    return "erro ao logar usuário";
  }
}
