import 'dart:developer';

import 'package:anonymous_foodie/model/hive_model/product_hive.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final cartControllerProvider=StateNotifierProvider<CartController,List<ProductHive>>((ref) => CartController());

class CartController extends StateNotifier<List<ProductHive>> {
  CartController() : super([]);

  addToCart(ProductHive product) {

    final int cartIndex=state.indexWhere((element) => element.name==product.name);
   

    if(cartIndex == -1){
    state = [...state, product];
    saveToCart();
    }
    else{
      log("Product Already Added");
    }
  }

  Future<void> saveToCart() async {
    final box = await Hive.openBox<ProductHive>('cartBox');
    box.clear();
    box.addAll(state);
  }

  Future<void> getAllCartProducts() async {
    final box = await Hive.openBox<ProductHive>('cartBox');
    state = box.values.toList();
  }

  removeCartProduct(String name){
    state=state.where((element) => element.name!= name).toList();



  }
}
