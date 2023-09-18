import 'package:cloud_firestore/cloud_firestore.dart';

class PautaModel {
  String? documentId;
  late String title;
  late String subtitle;
  late String description;
  late String image;
  late bool? isFavorite;

  PautaModel({
    this.documentId,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.image,
    this.isFavorite,
  });

  PautaModel.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    documentId = documentSnapshot.id;
    title = documentSnapshot["title"];
    subtitle = documentSnapshot["subtitle"];
    description = documentSnapshot["description"];
    image = documentSnapshot["image"];
    isFavorite = documentSnapshot["isFavorite"];
  }
}
