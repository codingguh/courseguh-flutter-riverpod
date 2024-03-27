import 'package:courseguh/common/models/course_entites.dart';
import 'package:courseguh/common/utils/app_colors.dart';
import 'package:courseguh/common/utils/constants.dart';
import 'package:courseguh/common/utils/image_res.dart';
import 'package:courseguh/common/widgets/app_shadow.dart';
import 'package:courseguh/common/widgets/button_widget.dart';
import 'package:courseguh/common/widgets/image_widgets.dart';
import 'package:courseguh/common/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class CourseDetailThumbnail extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailThumbnail({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return AppBoxDecorationImage(
      imagePath: courseItem.thumbnail,
      width: double.infinity,
      height: 168.h,
      fit: BoxFit.cover,
      borderRadius: 20,
    );
  }
}

class CourseDetailFollower extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailFollower({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      width: 325.w,
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              decoration: appBoxShadow(radius: 7),
              child: const Text10Normal(
                  text: "Author page", color: AppColors.primaryElementText),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.w),
            child: Row(
              children: [
                const AppImage(imagePath: ImageRes.people),
                const SizedBox(
                  width: 5,
                ),
                Text11Normal(
                  text: courseItem.follow.toString() == null.toString()
                      ? "0 People"
                      : "${courseItem.follow.toString()} Person",
                  color: AppColors.primaryThreeElementText,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.w),
            child: Row(
              children: [
                const AppImage(imagePath: ImageRes.star),
                const SizedBox(
                  width: 5,
                ),
                Text11Normal(
                  text: courseItem.score.toString() == null.toString()
                      ? "0 "
                      : "${courseItem.score.toString()} ",
                  color: AppColors.primaryThreeElementText,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CourseDetailDescription extends StatefulWidget {
  final CourseItem courseItem;

  const CourseDetailDescription({Key? key, required this.courseItem})
      : super(key: key);

  @override
  _CourseDetailDescriptionState createState() =>
      _CourseDetailDescriptionState();
}

class _CourseDetailDescriptionState extends State<CourseDetailDescription> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    String description = _isExpanded
        ? widget.courseItem.description!
        : (widget.courseItem.description!.length > 222
            ? "${widget.courseItem.description!.substring(0, 215)}..."
            : widget.courseItem.description!);

    return Container(
      margin: EdgeInsets.only(top: 15.h, bottom: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text16Normal(
            text: widget.courseItem.name == null
                ? "No name found"
                : widget.courseItem.name!,
            color: AppColors.primaryText,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 5.h,
          ),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              HtmlWidget(description), // Content of the description
              !_isExpanded && widget.courseItem.description!.length > 220
                  ? Positioned(
                      bottom: -12,
                      right: 0,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _isExpanded = true;
                          });
                        },
                        child: const Text(
                          'Show More',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    )
                  : !_isExpanded
                      ? const SizedBox()
                      : Positioned(
                          bottom: -13,
                          right: 0,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _isExpanded = false;
                              });
                            },
                            child: const Text(
                              'Show Less',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
            ],
          ),
        ],
      ),
    );
  }
}

class CourseDetailGoBuyButton extends StatelessWidget {
  const CourseDetailGoBuyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppButton(buttonName: "Go Buy");
  }
}

class CourseDetailIncludes extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailIncludes({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text14Normal(
            text: "The Course Includes",
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 12.h,
          ),
          CourseInfo(
            imagePath: ImageRes.video_detail,
            length: courseItem.video_len,
            infoText: "Hours video.",
          ),
          CourseInfo(
            imagePath: ImageRes.file_detail,
            length: courseItem.lesson_num,
            infoText: "Numbers of file.",
          ),
          CourseInfo(
            imagePath: ImageRes.download_detail,
            length: courseItem.down_num,
            infoText: "Numbers of items to download.",
          ),
        ],
      ),
    );
  }
}

class CourseInfo extends StatelessWidget {
  final String imagePath;
  final int? length;
  final String? infoText;
  const CourseInfo(
      {super.key,
      required this.imagePath,
      this.length,
      this.infoText = "Items"});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 9.h),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            child: AppImage(
              imagePath: imagePath,
              width: 30,
              height: 30,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.w),
            child: Text11Normal(
              color: AppColors.primarySecondaryElementText,
              text: length == null ? "O $infoText" : "$length $infoText",
            ),
          )
        ],
      ),
    );
  }
}

class LessonInfo extends StatelessWidget {
  const LessonInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text14Normal(
            text: "Lesson list",
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            width: 325.w,
            height: 86.h,
            decoration: appBoxShadow(
                radius: 10,
                sR: 2,
                bR: 3,
                color: const Color.fromRGBO(255, 255, 255, 1)),
            child: InkWell(
              onTap: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppBoxDecorationImage(
                    width: 60.w,
                    height: 60.h,
                    fit: BoxFit.fill,
                    imagePath:
                        "https://assets.materialup.com/uploads/b362f051-7a4c-493c-ab8c-79b782fae536/preview.jpg",
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text13Normal(
                        text: "This is first lesson",
                      ),
                      Text10Normal(
                        text: "This is first lesson",
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  const AppImage(
                    imagePath: ImageRes.arrow_right,
                    width: 24,
                    height: 24,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
