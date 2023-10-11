import 'dart:developer';

import 'package:anonymous_foodie/controller/cart_controller.dart';
import 'package:anonymous_foodie/model/hive_model/product_hive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../provider/global_provider.dart';


class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState<CartPage> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartList = ref.watch(cartControllerProvider);

    return Scaffold(
        body: SafeArea(

          
      child: ListView.builder(
        itemCount: cartList.length,
        itemBuilder: (context, index) {
          final product = cartList[index];
          return ListTile(
            title: Text(product.name!),
            subtitle: Text('\$${product.price!.toStringAsFixed(2)}'),
            trailing: InkWell(
              onTap: (){
                ref.read(cartControllerProvider.notifier).removeCartProduct(product.name!);
              },
              child: Icon(Icons.remove_circle)),
          );
        },
      ),
    ));
  }
}
