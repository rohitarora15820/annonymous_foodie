import 'dart:developer';

import 'package:anonymous_foodie/constant/size.dart';
import 'package:anonymous_foodie/controller/category_controller.dart';
import 'package:anonymous_foodie/controller/product_controller.dart';
import 'package:anonymous_foodie/model/hive_model/product_hive.dart';
import 'package:anonymous_foodie/model/product_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../controller/cart_controller.dart';

class ProductList extends ConsumerStatefulWidget {
  final String categoryName;
  const ProductList({super.key, required this.categoryName});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoryListState();
}

class _CategoryListState extends ConsumerState<ProductList> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(getproductsByCategory(widget.categoryName));

    return data.when(
        data: (data) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 58,
                childAspectRatio: 161 / 214),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {

             ProductModel model=     ProductModel(
                          name: data[index].name??"",
                          image: data[index].image??'',
                          detail: data[index].detail??'',
                          price: data[index].price,
                          isPopular: data[index].isPopular,
                          categoryName: data[index].categoryName??'',
                          rating: data[index].rating,
                          cheese: data[index].cheese,
                          tomato: data[index].tomato,
                          masala: data[index].masala
                          );
                  GoRouter.of(context).pushNamed('productDetail',
                      extra: model);
                },
                child: Container(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomRight,
                          colors: [Color(0xffEBE8E8), Color(0xffEFEEEE)]),
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 27.0.w),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 130.w,
                          height: 130.h,
                          child: Image.network(data[index].image),
                        ),
                        getVerticalSpace(8),
                        Text(
                          data[index].name,
                          style:
                              TextStyle(fontSize: 18.sp, fontFamily: "Poppins"),
                        ),
                        getVerticalSpace(8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${data[index].price}',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: "Poppins",
                                  color: const Color(0xffC9AA05)),
                            ),
                            InkWell(
                              onTap: () {
                                ref
                                    .read(cartControllerProvider.notifier)
                                    .addToCart(ProductHive(
                                        name: data[index].name,
                                        categoryName: data[index].categoryName,
                                        detail: data[index].detail,
                                        image: data[index].image,
                                        isPopular: data[index].isPopular,
                                        price: data[index].price,
                                        quantity: 1));
                              },
                              child: Icon(
                                Icons.add_circle,
                                color: Color(0xff0E803C),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );

          // return Container(
          //   color: Colors.amber,
          //   height: 250.h,
          //   // width: double.infinity,
          //   child: GridView.builder(
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,

          //     ),

          //     physics: const ClampingScrollPhysics(),
          //     scrollDirection: Axis.vertical,
          //     reverse: false,
          //     shrinkWrap: true,
          //     itemCount: data.length,
          //     // separatorBuilder: (context, index) {
          //     //   return SizedBox(
          //     //     width: 22.w,
          //     //   );
          //     // },
          //     itemBuilder: (context, index) {
          //       return Column(
          //         children: [
          //           Container(
          //               width: 161.w,
          //               height: 214.h,
          //               decoration: BoxDecoration(
          //                   color: const Color(0xfff5f5f5),
          //                   borderRadius: BorderRadius.circular(20)),
          //               child: Center(
          //                 child: Image.network(
          //                   data[index].image,
          //                   width: 60.h,
          //                   height: 60.h,
          //                 ),
          //               )),

          //         ],
          //       );
          //     },
          //   ),
          // );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
