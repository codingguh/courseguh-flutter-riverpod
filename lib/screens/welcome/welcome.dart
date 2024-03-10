import 'package:courseguh/common/widgets/widgets.dart';
import 'package:courseguh/screens/welcome/notifier/welcome_notifier.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// final indexProvider = StateProvider<int>((ref) => 0);

class Welcome extends ConsumerWidget {
  Welcome({Key? key}) : super(key: key);

  final PageController _controller = PageController();
  // int dotsIndex = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexDotProviderProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: EdgeInsets.only(top: 30.h),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                //showing our three welcome page
                PageView(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (value) {
                    ref
                        .read(indexDotProviderProvider.notifier)
                        .changeIndex(value);
                  },
                  children: [
                    appOnBoardingScreen(_controller,
                        imagePath: "assets/images/reading.png",
                        title: "First See Learning",
                        subTitle:
                            "Forget about the paper, now learning in application",
                        index: 1,
                        context: context),
                    appOnBoardingScreen(_controller,
                        imagePath: "assets/images/man.png",
                        title: "Connect with everyone",
                        subTitle:
                            "Always keep in touch with your tutor and froends.Let's get connected",
                        index: 2,
                        context: context),
                    appOnBoardingScreen(_controller,
                        imagePath: "assets/images/boy.png",
                        title: "Always Facinated Learning",
                        subTitle:
                            "Anywhere, anytime, The time is at your disretion. So study whereever you can ",
                        index: 3,
                        context: context),
                  ],
                ),
                //for showing dots indicator
                Positioned(
                  bottom: 50,
                  child: DotsIndicator(
                    position: index,
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                        activeSize: const Size(24.0, 8.0),
                        size: const Size.square(9.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.w))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
