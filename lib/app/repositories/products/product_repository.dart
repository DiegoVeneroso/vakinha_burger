import 'package:vakinha_burger_mobile/app/models/product_model.dart';

abstract class ProductRepository {
  Stream<List<ProductModel>> findAll();
}
