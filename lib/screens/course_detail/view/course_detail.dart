import 'package:courseguh/common/widgets/app_bar.dart';
import 'package:courseguh/screens/course_detail/controller/course_detail_controller.dart';
import 'package:courseguh/screens/course_detail/widget/course_detail_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expandable_text/expandable_text.dart';

class CourseDetail extends ConsumerStatefulWidget {
  const CourseDetail({super.key});

  @override
  ConsumerState<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends ConsumerState<CourseDetail> {
  late var args;
  @override
  void didChangeDependencies() {
    var id = ModalRoute.of(context)!.settings.arguments as Map;

    args = id["id"];
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var stateData =
        ref.watch(courseDetailControllerProvider(index: args.toInt()));

    print(stateData);
    return Scaffold(
      appBar: buildGlobalAppBar(title: "Course Detail", context),
      body: stateData.when(
          data: (data) => data == null
              ? const SizedBox()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CourseDetailThumbnail(courseItem: data),
                          CourseDetailFollower(courseItem: data),
                          CourseDetailDescription(
                            courseItem: data,
                          ),
                          const CourseDetailGoBuyButton(),
                          CourseDetailIncludes(
                            courseItem: data,
                          ),
                          LessonInfo()
                        ]),
                  ),
                ),
          error: (error, trackStace) => Text(error.toString()),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
