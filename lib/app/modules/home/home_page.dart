// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_appbar.dart';
// import 'package:vakinha_burger_mobile/app/models/pauta_model.dart';
// import './home_controller.dart';
// import 'package:validatorless/validatorless.dart';

// class HomePage extends GetView<HomeController> {
//   final _loading = false.obs;

//   final _formKey = GlobalKey<FormState>();
//   final _titleEC = TextEditingController();
//   final _subtitleEC = TextEditingController();
//   final _descriptionEC = TextEditingController();
//   final _imageEC = TextEditingController();

//   final CollectionReference _productss =
//       FirebaseFirestore.instance.collection('product');
//   HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
// appBar: VakinhaAppbar(),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('product')
//             .where('subtitle', isGreaterThanOrEqualTo: '1')
//             // .orderBy('createdon', descending: true)
//             .snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) return Text('Error: ${snapshot.error}');
//           switch (snapshot.connectionState) {
//             case ConnectionState.waiting:
//               return const CircularProgressIndicator();
//             default:
//               return ListView(
//                 children: snapshot.data!.docs.map((DocumentSnapshot document) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Card(
//                       elevation: 4.0,
//                       child: Column(
//                         children: [
//                           ListTile(
//                             title: Text(
//                               document['title'],
//                               style:
//                                   const TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             // subtitle: Text(document['name']),
//                             trailing: Icon(Icons.favorite_outline),
//                           ),
//                           Container(
//                             height: 200.0,
//                             child: Ink.image(
//                               image: NetworkImage(document['image']),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           Container(
//                             padding: EdgeInsets.all(8.0),
//                             alignment: Alignment.centerLeft,
//                             child: Text(document['subtitle']),
//                           ),
//                           ButtonBar(
//                             children: [
//                               TextButton(
//                                 onPressed: () {
//                                   controller.deletePautaController(
//                                       document['documentId']);
//                                 },
//                                 child: Text('Excluir'),
//                               ),
//                               TextButton(
//                                 onPressed: () {
//                                   controller.updatePautaController(
//                                       document['documentId'],
//                                       PautaModel(
//                                         title: 'fdsaf',
//                                         subtitle: 'subtitle5',
//                                         description: 'description5',
//                                         image:
//                                             'https://source.unsplash.com/random/800x600?house',
//                                       ));
//                                 },
//                                 child: Text('Atualizar'),
//                               ),
//                               TextButton(
//                                 onPressed: () {
//                                   Get.toNamed(
//                                     '/pauta',
//                                     arguments: document['id'],
//                                   );
//                                 },
//                                 child: Text('Detalhes'),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               );
//           }
//         },
//       ),
// floatingActionButton: FloatingActionButton.extended(
//   icon: const Icon(Icons.add),
//   label: const Text('Adicionar pauta'),
//   onPressed: () {
//     Get.defaultDialog(
//         title: "Adicionar pauta",
//         middleText: "Hello world!",
//         backgroundColor: Colors.white,
//         titleStyle: TextStyle(color: Colors.black),
//         middleTextStyle: TextStyle(color: Colors.white),
//         // textConfirm: "Confirm",
//         // textCancel: "Cancel",
//         cancelTextColor: Colors.white,
//         confirmTextColor: Colors.white,
//         buttonColor: Colors.red,
//         barrierDismissible: false,
//         radius: 10,
//         content: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 TextFormField(
//                   controller: _titleEC,
//                   decoration: InputDecoration(
//                     labelText: 'Titulo',
//                   ),
//                   validator: Validatorless.multiple(
//                       [Validatorless.required('Titulo é obrigatório')]),
//                 ),
//                 TextFormField(
//                   controller: _subtitleEC,
//                   decoration: InputDecoration(
//                     labelText: 'Subtítulo',
//                   ),
//                   validator: Validatorless.multiple([
//                     Validatorless.required('Subtítulo é obrigatório')
//                   ]),
//                 ),
//                 TextFormField(
//                   controller: _descriptionEC,
//                   decoration: InputDecoration(
//                     labelText: 'Descrição',
//                   ),
//                   validator: Validatorless.multiple([
//                     Validatorless.required('Descrição é obrigatória')
//                   ]),
//                 ),
//                 TextFormField(
//                   controller: _imageEC,
//                   decoration: InputDecoration(
//                     labelText: 'link da Imagem',
//                   ),
//                   validator: Validatorless.multiple([
//                     Validatorless.required('Link da imagem é obrigatório')
//                   ]),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     final formValid =
//                         _formKey.currentState?.validate() ?? false;
//                     if (formValid) {
//                       controller.addPautaController(
//                         PautaModel(
//                             title: _titleEC.text,
//                             subtitle: _subtitleEC.text,
//                             description: _descriptionEC.text,
//                             image: _imageEC.text),
//                       );
//                     }
//                   },
//                   // onPressed: () {
//                   //   controller.addPautaController(PautaModel(
//                   //       title: 'ultimo5',
//                   //       subtitle: 'subtitle5',
//                   //       description: 'description5',
//                   //       image:
//                   //           'https://source.unsplash.com/random/800x600?house',
//                   //       isFavorite: false));
//                   // },
//                   child: Text('Adicionar'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     Get.back();
//                   },
//                   child: Text('Voltar'),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   },
// ), // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }

import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/services/auth_service.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/drawer_custom.dart';
import 'package:vakinha_burger_mobile/app/models/pauta_model.dart';
import 'package:vakinha_burger_mobile/app/modules/home/home_controller.dart';
import 'package:validatorless/validatorless.dart';

class HomePage extends GetView<HomeController> {
  final _formKey = GlobalKey<FormState>();
  final _titleEC = TextEditingController();
  final _subtitleEC = TextEditingController();
  final _descriptionEC = TextEditingController();
  final _imageEC = TextEditingController();

  var name = ''.obs;

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AnimatedSearchBar(
            label: "TAE CONSUNI",
            labelStyle: const TextStyle(fontSize: 16),
            searchStyle: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            searchDecoration: const InputDecoration(
              hintText: "Pesquisar pauta",
              alignLabelWithHint: true,
              fillColor: Colors.white,
              focusColor: Colors.white,
              hintStyle: TextStyle(color: Colors.white70),
              border: InputBorder.none,
            ),
            onChanged: (val) {
              print("value on Change");
              name.value = val;

              // searchText = value;
            },
          ),
        ),
        body: Obx(() => StreamBuilder<QuerySnapshot>(
              stream: (name != '' && name != null)
                  ? FirebaseFirestore.instance
                      .collection('pautas')
                      .where('titleSearch', arrayContains: name.toString())
                      .snapshots()
                  : FirebaseFirestore.instance
                      .collection('pautas')
                      .orderBy('createdon', descending: true)
                      .snapshots(),
              builder: (context, snapshot) {
                return (snapshot.connectionState == ConnectionState.waiting)
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot data = snapshot.data!.docs[index];
                          return Container(
                            padding: const EdgeInsets.only(top: 16),
                            child: Column(
                              children: [
                                Card(
                                  elevation: 4.0,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text(
                                          data['title'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // subtitle: Text(document['name']),
                                        trailing:
                                            const Icon(Icons.favorite_outline),
                                      ),
                                      Container(
                                        height: 200.0,
                                        child: Ink.image(
                                          image: NetworkImage(data['image']),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(8.0),
                                        alignment: Alignment.centerLeft,
                                        child: Text(data['subtitle']),
                                      ),
                                      ButtonBar(
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              controller.deletePautaController(
                                                  data['documentId']);
                                            },
                                            child: const Text('Excluir'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              controller.updatePautaController(
                                                  data['documentId'],
                                                  PautaModel(
                                                    title: 'fdsaf',
                                                    subtitle: 'subtitle5',
                                                    description: 'description5',
                                                    image:
                                                        'https://source.unsplash.com/random/800x600?house',
                                                  ));
                                            },
                                            child: const Text('Editar'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Get.toNamed(
                                                '/pauta',
                                                arguments: data['id'],
                                              );
                                            },
                                            child: const Text('Ver mais'),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
              },
            )),
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          label: const Text('Adicionar pauta'),
          onPressed: () {
            Get.defaultDialog(
                title: "Adicionar pauta",
                middleText: "Hello world!",
                backgroundColor: Colors.white,
                titleStyle: TextStyle(color: Colors.black),
                middleTextStyle: TextStyle(color: Colors.white),
                // textConfirm: "Confirm",
                // textCancel: "Cancel",
                cancelTextColor: Colors.white,
                confirmTextColor: Colors.white,
                buttonColor: Colors.red,
                barrierDismissible: false,
                radius: 10,
                content: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _titleEC,
                          decoration: InputDecoration(
                            labelText: 'Titulo',
                          ),
                          validator: Validatorless.multiple(
                              [Validatorless.required('Titulo é obrigatório')]),
                        ),
                        TextFormField(
                          controller: _subtitleEC,
                          decoration: InputDecoration(
                            labelText: 'Subtítulo',
                          ),
                          validator: Validatorless.multiple([
                            Validatorless.required('Subtítulo é obrigatório')
                          ]),
                        ),
                        TextFormField(
                          controller: _descriptionEC,
                          decoration: InputDecoration(
                            labelText: 'Descrição',
                          ),
                          validator: Validatorless.multiple([
                            Validatorless.required('Descrição é obrigatória')
                          ]),
                        ),
                        TextFormField(
                          controller: _imageEC,
                          decoration: InputDecoration(
                            labelText: 'link da Imagem',
                          ),
                          validator: Validatorless.multiple([
                            Validatorless.required(
                                'Link da imagem é obrigatório')
                          ]),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final formValid =
                                _formKey.currentState?.validate() ?? false;
                            if (formValid) {
                              controller.addPautaController(
                                PautaModel(
                                    title: _titleEC.text,
                                    subtitle: _subtitleEC.text,
                                    description: _descriptionEC.text,
                                    image: _imageEC.text),
                              );
                            }
                          },
                          // onPressed: () {
                          //   controller.addPautaController(PautaModel(
                          //       title: 'ultimo5',
                          //       subtitle: 'subtitle5',
                          //       description: 'description5',
                          //       image:
                          //           'https://source.unsplash.com/random/800x600?house',
                          //       isFavorite: false));
                          // },
                          child: Text('Adicionar'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('Voltar'),
                        ),
                      ],
                    ),
                  ),
                ));
          },
        ),
        drawer: DrawerCustom());
  }
}


//classe para enviar email

