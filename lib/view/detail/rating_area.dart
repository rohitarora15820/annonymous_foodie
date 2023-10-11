import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/colors.dart';

class RatingArea extends ConsumerStatefulWidget {
  final String rating;
  final String price;
  const RatingArea({super.key,required this.rating,required this.price});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RatingAreaState();
}

class _RatingAreaState extends ConsumerState<RatingArea> {

  @override
  Widget build(BuildContext context) {
    return     Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100.w,
                        height: 52.h,
                        decoration: BoxDecoration(
                            color: kPrimary,
                            borderRadius: BorderRadius.circular(40.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: kSecondary,
                            ),
                            Text(
                             widget.rating,
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Text(widget.price,
                        
                        style: TextStyle(
                            color: kSecondary,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 24.sp),
                      )
                    ],
                  );
  }
}