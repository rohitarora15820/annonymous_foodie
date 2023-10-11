

import 'package:anonymous_foodie/model/hive_model/product_hive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';



final fireStoreProvider=Provider((ref) => FirebaseFirestore.instance);
final firebaseStorageProvider=Provider((ref) => FirebaseStorage.instance);


// final cartServicesProvider=FutureProvider<List<ProductHive>>((ref) => ref.read(cartProvider.notifier).getAllData());