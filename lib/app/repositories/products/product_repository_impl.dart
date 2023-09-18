import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vakinha_burger_mobile/app/models/product_model.dart';

import './product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Stream<List<ProductModel>> findAll() => FirebaseFirestore.instance
      .collection('produtc')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList());
}
