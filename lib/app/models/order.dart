import 'package:vakinha_burger_mobile/app/models/shopping_card_model.dart';

class Order {
  int UserId;
  String cpf;
  String address;
  List<ShoppingCardModel> items;
  Order({
    required this.UserId,
    required this.cpf,
    required this.address,
    required this.items,
  });
}
