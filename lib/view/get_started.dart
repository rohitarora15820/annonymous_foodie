import 'dart:async';

import 'package:anonymous_foodie/constant/colors.dart';
import 'package:anonymous_foodie/constant/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../constant/assets_path.dart';
import '../widgets/custom_button.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  double rotationAngle = 0.0;

  @override
  void initState() {
    // TODO: implement initState

    const rotationSpeed = Duration(milliseconds: 100);
    Timer.periodic(rotationSpeed, (Timer timer) {
      setState(() {
        rotationAngle += 5.0;
        if (rotationAngle >= 360) {
          rotationAngle = 0.0;
        }
      });
    });

    // Future.delayed(const Duration(seconds: 5))
    //     .then((value) => GoRouter.of(context).push('/started'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: AlignmentDirectional.bottomEnd,
                colors: [Color(0xff4a2e9e), Color(0xff7660bc)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: AlwaysStoppedAnimation(rotationAngle / 360),
              child: Image.asset(
                kLogo,
                width: 345.w,
                height: 345.h,
              ),
            ),
            getVerticalSpace(54),
            Text(
              "Enjoy\nYour Food",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 42.sp,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.bold),
            ),
            getVerticalSpace(54),
            CustomButton(
              width: 225.w,
              content: "Get Started",
              bgColor: Colors.white,
              textColor: kPrimary,
              onTap: () {
                GoRouter.of(context).push('/landing');
              },
            )
          ],
        ));
  }
}
