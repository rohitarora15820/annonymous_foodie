import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final String content;
  final Color bgColor;
  final Color textColor;
  final Function()? onTap;
  const CustomButton({
    required this.content,
    required this.width,
    required this.bgColor,
    required this.textColor,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 68.h,
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(25.r)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(36, 13, 35, 14),
          child: Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: textColor,
                fontFamily: 'Poppins',
                fontSize: 27.sp,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
