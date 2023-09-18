import 'package:vakinha_burger_mobile/app/models/pauta_model.dart';

abstract class PautaRepository {
  Future<void> addPautaRepository(PautaModel pautaModel);
  Future<void> deletePautaRepository(String documentId);
  Future<void> updateFavoriteRepository(String documentId);
  Future<void> updatePautaRepository(String documentId, PautaModel pautaModel);
}
