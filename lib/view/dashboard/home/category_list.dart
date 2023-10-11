import 'package:anonymous_foodie/constant/colors.dart';
import 'package:anonymous_foodie/constant/size.dart';
import 'package:anonymous_foodie/controller/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../controller/product_controller.dart';

class CategoryList extends ConsumerStatefulWidget {
  final String categoryName;
  final Function? onSelect;

  const CategoryList(
      {super.key, required this.onSelect, required this.categoryName});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoryListState();
}

class _CategoryListState extends ConsumerState<CategoryList> {
  bool enabledCategory = false;

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(categoryItemsProvider);
    return data.when(
        data: (data) {
          return SizedBox(
            height: 120.h,
            width: double.infinity,
            child: ListView.separated(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              reverse: false,
              shrinkWrap: true,
              itemCount: data.length,
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 22.w,
                );
              },
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    widget.onSelect!(data[index].name.toString());
                  },
                  child: Column(
                    children: [
                      Container(
                          width: 80.h,
                          height: 80.h,
                          decoration: BoxDecoration(
                              color: widget.categoryName == data[index].name
                                  ? kPrimary
                                  : const Color(0xffEFEEEE),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Image.network(
                              data[index].image,
                              width: 60.h,
                              height: 60.h,
                            ),
                          )),
                      getVerticalSpace(4),
                      Text(data[index].name),
                    ],
                  ),
                );
              },
            ),
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
