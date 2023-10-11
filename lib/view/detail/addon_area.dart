import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/assets_path.dart';
import '../../constant/colors.dart';
import 'package:badges/badges.dart' as badges;

import '../../constant/size.dart';

class AddOnArea extends ConsumerStatefulWidget {
  const AddOnArea({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddOnAreaState();
}

class _AddOnAreaState extends ConsumerState<AddOnArea> {
  bool cheeseColor = false;
  bool tomatoColor=false;
  bool masalaColor=false;

 List< Map<String,dynamic>> data=
[

  {
    "name":"cheese",
    "image":kcheese
  },
  {
    "name":"tomato",
    "image":ktomato
  },
  {
    "name":"masala",
    "image":kmasala
  },
]
  ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Add Ons",
          style: TextStyle(
              fontSize: 18.sp,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500),
        ),
        getVerticalSpace(5),
        SizedBox(
          height: 100.h,
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            badges.Badge(
                badgeContent: GestureDetector(
                  onTap: () {
                    setState(() {
                      cheeseColor = !cheeseColor;
                    });
                  },
                  child: const Icon(
                    Icons.add_circle,
                    color: Colors.green,
                  ),
                ),
                position: badges.BadgePosition.bottomEnd(),
                badgeStyle:
                    const badges.BadgeStyle(badgeColor: Colors.transparent),
                child: Container(
                  width: 80.w,
                  height: 80.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: cheeseColor ? kPrimary : const Color(0xffEFEEEE),
                      image:
                          const DecorationImage(image: NetworkImage(kcheese))),
                ),
              ),
              getHorizontalSpace(60),
              badges.Badge(
                badgeContent: GestureDetector(
                  onTap: () {
                    setState(() {
                      tomatoColor = !tomatoColor;
                    });
                  },
                  child: const Icon(
                    Icons.add_circle,
                    color: Colors.green,
                  ),
                ),
                position: badges.BadgePosition.bottomEnd(),
                badgeStyle:
                    const badges.BadgeStyle(badgeColor: Colors.transparent),
                child: Container(
                  width: 80.w,
                  height: 80.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: tomatoColor ? kPrimary : const Color(0xffEFEEEE),
                      image:
                          const DecorationImage(image: NetworkImage(ktomato))),
                ),
              ),
              getHorizontalSpace(60),
              badges.Badge(
                badgeContent: GestureDetector(
                  onTap: () {
                    setState(() {
                      masalaColor = !masalaColor;
                    });
                  },
                  child: const Icon(
                    Icons.add_circle,
                    color: Colors.green,
                  ),
                ),
                position: badges.BadgePosition.bottomEnd(),
                badgeStyle:
                    const badges.BadgeStyle(badgeColor: Colors.transparent),
                child: Container(
                  width: 80.w,
                  height: 80.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: masalaColor ? kPrimary : const Color(0xffEFEEEE),
                      image:
                          const DecorationImage(image: NetworkImage(kmasala))),
                ),
              )
          ],
          ),
        )
      ],
    );
  }
}
