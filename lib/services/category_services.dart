import 'package:anonymous_foodie/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/category_model.dart';
import '../provider/global_provider.dart';

final categoryServiceProvider = Provider(
    (ref) => CategoryServices(firebaseFireStore: ref.watch(fireStoreProvider)));

class CategoryServices {
  final FirebaseFirestore _firebaseFireStore;

  CategoryServices({required FirebaseFirestore firebaseFireStore})
      : _firebaseFireStore = firebaseFireStore;

  CollectionReference get collectionReference =>
      _firebaseFireStore.collection('categories');

  Stream<List<CategoryModel>> getCategories() {
    return collectionReference.orderBy("name").snapshots().map((event) {
      List<CategoryModel> categoriesList = [];
      for (var i in event.docs) {
        categoriesList
            .add(CategoryModel.fromMap(i.data() as Map<String, dynamic>));
      }
      return categoriesList;
    });
  }


}
