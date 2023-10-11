import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/assets_path.dart';

class CustomMenu extends StatelessWidget {
  const CustomMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Menu",
          style: TextStyle(
              fontSize: 42.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.normal),
        ),
        CircleAvatar(
          child: Image.asset(
            kProfile,
            width: 56.w,
            height: 56.h,
          ),
        )
      ],
    );
  }
}