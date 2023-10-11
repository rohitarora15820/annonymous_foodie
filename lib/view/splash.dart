import 'dart:async';

import 'package:anonymous_foodie/constant/assets_path.dart';
import 'package:anonymous_foodie/constant/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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

    Future.delayed(const Duration(seconds: 5))
        .then((value) => GoRouter.of(context).push('/started'));

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
            const SpinKitSpinningLines(color: Colors.white)
          ],
        ));
  }
}
