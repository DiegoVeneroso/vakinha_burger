import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vakinha_burger_mobile/app/models/user_model.dart';

class AuthService extends GetxService {
  // final _isLogged = RxnBool();
  // final _getStorage = GetStorage();

  //Firebase Autencicacao
  late Rx<User?> firebaseUser;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    // print('rota com firebase');
    if (user != null) {
      // print('usuario logado no firebase');
      Future.delayed(
          //redireciona para homepage
          const Duration(seconds: 2),
          () => Get.offAllNamed('/home'));

      // print(firebaseUser);
    } else {
      // print('usuario não logado no firebase');
      Future.delayed(
          const Duration(seconds: 2), () => Get.offAllNamed('/auth/login'));
    }
  }
  //Firebase Autencicacao

  Future<AuthService> init() async {
    // _getStorage.listenKey(Constants.USER_KEY, (value) {
    //   // if(value != null) {
    //   //   _isLogged(true);
    //   // }else{
    //   //   _isLogged(false);
    //   // }
    //   _isLogged(value != null);
    // });

    // ever<bool?>(_isLogged, (isLogged) {
    //   if (isLogged == null || !isLogged) {
    //     Get.offAllNamed('/auth/login');
    //   } else {
    //     Get.offAllNamed('/home');
    //   }
    // });

    // // final isLoggedData = getUserId() != null;
    // _isLogged(getUserId() != null);

    return this;
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }

  String? getUserId() => Get.find<AuthService>().firebaseUser.value?.uid;

  Stream<QuerySnapshot> getName() {
    CollectionReference notesItemCollection = FirebaseFirestore.instance
        .doc('fZQptJqRl6sIPRjit5XL')
        .collection('users');

    return notesItemCollection.snapshots();
  }
}
