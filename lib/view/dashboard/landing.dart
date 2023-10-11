import 'package:anonymous_foodie/constant/colors.dart';
import 'package:anonymous_foodie/controller/cart_controller.dart';
import 'package:anonymous_foodie/view/dashboard/cart/cart_page.dart';
import 'package:anonymous_foodie/view/dashboard/category/category_page.dart';
import 'package:anonymous_foodie/view/dashboard/home/home_page.dart';
import 'package:anonymous_foodie/view/dashboard/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart' as badges;

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int pageIndex = 0;
  List<Widget> pages = const [
    HomePage(),
    CategoryPage(),
    CartPage(),
    ProfilePage()
  ];

  onPageChanged(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: pageIndex,
          selectedItemColor: kPrimary,
          iconSize: 32.sp,
          unselectedItemColor: const Color(0xff989899),
          onTap: onPageChanged,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
          const   BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          const   BottomNavigationBarItem(icon: Icon(Icons.category), label: ""),
            BottomNavigationBarItem(
              
                icon: badges.Badge(
                  badgeContent:Consumer(
                    builder: (context, ref, child) {
                      return  Text(
                      ref.watch(cartControllerProvider).length.toString(),
                      style:const  TextStyle(color: Colors.white),
                    );
                    },
                    
                  ),
                  badgeStyle: badges.BadgeStyle(badgeColor: kPrimary),
                  child:const  Icon(Icons.shopping_cart_outlined),
                ),
                label: ""),
          const   BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: "")
          ]),
      body: pages[pageIndex],
    );
  }
}
