import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vakinha_burger_mobile/app/models/pauta_model.dart';
import 'package:get/get.dart';

import 'pauta_repository.dart';

class PautaRepositoryImpl implements PautaRepository {
  adicionaCaracterDoTituloParaPesquisa(String title) {
    List<String> caracterDoTitle = [];
    String text = '';
    for (int i = 0; i < title.length; i++) {
      text = text + title[i];
      caracterDoTitle.add(text);
    }
    return caracterDoTitle;
  }

  @override
  Future<void> addPautaRepository(PautaModel pautaModel) async {
    await FirebaseFirestore.instance.collection('pautas')
        // .doc(auth.currentUser!.uid)
        // .collection('todos')
        .add({
      'title': pautaModel.title,
      'subtitle': pautaModel.subtitle,
      'description': pautaModel.description,
      'image': pautaModel.image,
      'isFavorite': false,
      'createdon': Timestamp.now(),
      'titleSearch': adicionaCaracterDoTituloParaPesquisa(pautaModel.title)
    }).then((document) async {
      await FirebaseFirestore.instance
          .collection('pautas')
          .doc(document.id)
          .update({
        'documentId': document.id,
      });
    });
  }

  @override
  Future<void> deletePautaRepository(String documentId) async {
    await FirebaseFirestore.instance
        .collection('product')
        // .doc(auth.currentUser!.uid)
        // .collection('todos')
        .doc(documentId)
        .delete();
  }

  @override
  Future<void> updateFavoriteRepository(String documentId) async {
    await FirebaseFirestore.instance
        .collection('users')
        // .doc(auth.currentUser!.uid)
        // .collection('todos')
        .doc(documentId)
        .update(
      {
        'isFavorite': true,
      },
    );
  }

  @override
  Future<void> updatePautaRepository(
      String documentId, PautaModel pautaModel) async {
    await FirebaseFirestore.instance
        .collection('product')
        .doc(documentId)
        .update({
      'title': pautaModel.title,
      'subtitle': pautaModel.subtitle,
      'description': pautaModel.description,
      'image': pautaModel.image,
      'createdon': Timestamp.now(),
    });
  }
}
