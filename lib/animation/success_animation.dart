import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SuccessChecklistAnimation extends StatefulWidget {
  const SuccessChecklistAnimation({super.key});

  @override
  State<SuccessChecklistAnimation> createState() =>
      _SuccessChecklistAnimationState();
}

class _SuccessChecklistAnimationState extends State<SuccessChecklistAnimation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: LottieBuilder.asset(
            'assets/animation/cheklist.json',
            height: 300.h,
            reverse: true,
            repeat: true,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
