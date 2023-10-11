import 'dart:math';

import 'package:anonymous_foodie/constant/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'products_list.dart';
import 'category_list.dart';
import 'custom_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String categoryName = "All";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const CustomMenu(),
            CategoryList(
              categoryName: categoryName,
              onSelect: (value) {
                
                setState(() {
                  categoryName = value;
                });
              },
            ),
            Text(
              'Popular',
              style: TextStyle(fontSize: 24.sp, fontFamily: "Poppins"),
            ),
            getVerticalSpace(4),
            ProductList(
              categoryName: categoryName,
            )
          ],
        ),
      ),
    ));
  }
}
