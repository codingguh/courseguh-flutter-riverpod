import 'package:courseguh/common/models/course_entites.dart';
import 'package:courseguh/common/utils/app_colors.dart';
import 'package:courseguh/common/utils/constants.dart';
import 'package:courseguh/common/utils/image_res.dart';
import 'package:courseguh/common/widgets/app_shadow.dart';
import 'package:courseguh/common/widgets/image_widgets.dart';
import 'package:courseguh/common/widgets/text_widget.dart';
import 'package:courseguh/global.dart';
import 'package:courseguh/screens/home/controller/home_controller.dart';
import 'package:courseguh/screens/home/view/widgets/course_card_widget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget banner({required WidgetRef ref, required PageController controller}) {
  return Column(
    children: [
      //banner
      SizedBox(
        width: 325.w,
        height: 160.h,
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            ref.read(homeScreenBannerDotsProvider.notifier).setIndex(index);
          },
          children: [
            bannerContainer(imagePath: ImageRes.banner1),
            bannerContainer(imagePath: ImageRes.banner2),
            bannerContainer(imagePath: ImageRes.banner3)
          ],
        ),
      ),
      SizedBox(
        height: 5.h,
      ),
      //dots
      DotsIndicator(
        position: ref.watch(homeScreenBannerDotsProvider),
        dotsCount: 3,
        mainAxisAlignment: MainAxisAlignment.center,
        decorator: DotsDecorator(
            activeSize: const Size(24.0, 8.0),
            size: const Size.square(9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.w))),
      ),
    ],
  );
}

Widget bannerContainer({required String imagePath}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill)),
  );
}

Widget userName() {
  return Container(
    child: text24Normal(
        text: Global.storageService.getUserProfile().name!,
        fontweight: FontWeight.bold),
  );
}

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return text24Normal(
        text: Global.storageService.getUserProfile().name!,
        fontweight: FontWeight.bold);
  }
}

Widget helloText() {
  return Container(
    child: text24Normal(
        text: "Hello, ",
        color: AppColors.primaryThreeElementText,
        fontweight: FontWeight.bold),
  );
}

AppBar homeAppBar(WidgetRef ref) {
  var profileState = ref.watch(homeUserProfileProvider);

  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appImage(width: 18.w, height: 12.h, imagePath: ImageRes.menu),
          profileState.when(
              data: (value) {
                var avatar = value.avatar != null
                    ? "${AppConstants.SERVER_API_URL}${value.avatar}"
                    : "${AppConstants.SERVER_API_URL}uploads/default.png";
                return GestureDetector(
                  child: AppBoxDecorationImage(
                    imagePath: avatar,
                  ),
                );
              },
              error: (err, stack) => appImage(
                  width: 18.w, height: 12.h, imagePath: ImageRes.profile),
              loading: () => Container()),
        ],
      ),
    ),
  );
}

class HomeMenuBar extends StatelessWidget {
  const HomeMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //see all course
        Container(
          margin: EdgeInsets.only(top: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text16Normal(
                text: "Choice your course",
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
              ),
              GestureDetector(
                child: const Text10Normal(
                  text: "Sea All",
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        //course item button
        SizedBox(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: 15.w, top: 5.h, right: 15.w, bottom: 5.h),
                decoration:
                    appBoxShadow(color: AppColors.primaryElement, radius: 7.w),
                child: const Text11Normal(
                  text: "All",
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30.w),
                child: const Text11Normal(
                  text: "Popular",
                  color: AppColors.primaryThreeElementText,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30.w),
                child: const Text11Normal(
                  text: "Newest",
                  color: AppColors.primaryThreeElementText,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CourseItemGrid extends StatelessWidget {
  final WidgetRef ref;
  const CourseItemGrid({Key? key, required this.ref}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final courseState = ref.watch(homeCourseListProvider);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 0),
      child: courseState.when(
          data: (data) {
            return GridView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 9,
                mainAxisSpacing: 20,
                childAspectRatio: 0.8,
              ),
              itemCount: data?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return CourseCard(
                  course: data![index],
                  func: () {
                    print("SSFSDF ${data[index].id}");
                    Navigator.of(context).pushNamed("/course_detail",
                        arguments: {"id": data[index].id});
                  },
                );
              },
            );
          },
          error: (error, stackTrace) {
            print(stackTrace.toString());
            return Center(
              child: Text(error.toString()),
            );
          },
          loading: () => const Center(
                child: Text("Loading"),
              )),
    );
  }
}
