import 'dart:convert';

class OrderPix {
  String image;
  String code;
  double totalVAlue;

  OrderPix({
    required this.image,
    required this.code,
    required this.totalVAlue,
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'code': code,
      'totalVAlue': totalVAlue,
    };
  }

  factory OrderPix.fromMap(Map<String, dynamic> map) {
    return OrderPix(
      image: map['image'] ?? '',
      code: map['code'] ?? '',
      totalVAlue: map['totalVAlue']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderPix.fromJson(String source) =>
      OrderPix.fromMap(json.decode(source));

  OrderPix copyWith({
    String? image,
    String? code,
    double? totalVAlue,
  }) {
    return OrderPix(
      image: image ?? this.image,
      code: code ?? this.code,
      totalVAlue: totalVAlue ?? this.totalVAlue,
    );
  }
}
