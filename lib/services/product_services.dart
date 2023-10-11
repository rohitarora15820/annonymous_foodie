import 'dart:developer';

import 'package:anonymous_foodie/provider/global_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/product_model.dart';

final productServiceProvider = Provider(
    (ref) => ProductServices(firebaseFirestore: ref.watch(fireStoreProvider)));

class ProductServices {
  final FirebaseFirestore _firebaseFirestore;
  ProductServices({required FirebaseFirestore firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore;

  CollectionReference get reference =>
      _firebaseFirestore.collection("products");

  Stream<ProductModel> getProductByName(String name) {
return reference.doc(name).snapshots().map((event) {
 return ProductModel.fromMap(event.data() as Map<String,dynamic>);

});

    // return reference.where("name", isEqualTo: name).snapshots().map((event) {
    //   return ProductModel.fromMap(event.docs as Map<String, dynamic>);
    // });
  }

  Stream<List<ProductModel>> getProductByCategory(String categoryName) {
    List<ProductModel> products = [];
    return categoryName == "All"
        ? reference.snapshots().map((event) {
            products.clear();
            for (var i in event.docs) {
              products
                  .add(ProductModel.fromMap(i.data() as Map<String, dynamic>));
              log(i.data().toString());
            }
            return products;
          })
        : reference
            .where("categoryName", isEqualTo: categoryName)
            .snapshots()
            .map((event) {
            products.clear();
            // List<ProductModel> products = [];
            for (var i in event.docs) {
              products
                  .add(ProductModel.fromMap(i.data() as Map<String, dynamic>));
            }
            return products;
          });
  }
}
