import 'package:courseguh/common/widgets/app_bar.dart';
import 'package:courseguh/common/widgets/image_widgets.dart';
import 'package:courseguh/screens/home/controller/home_controller.dart';
import 'package:courseguh/screens/home/view/widgets/search_widgets.dart';
import 'package:courseguh/screens/home/view/widgets/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late PageController _controller;
  final ScrollController _scrollController = ScrollController();
  @override
  void didChangeDependencies() {
    _controller =
        PageController(initialPage: ref.watch(homeScreenBannerDotsProvider));

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: homeAppBar(ref),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              helloText(),
              const UserName(),
              SizedBox(
                height: 20.h,
              ),
              searchBar(),
              SizedBox(
                height: 20.h,
              ),
              banner(ref: ref, controller: _controller),
              const HomeMenuBar(),
              const CourseItemGrid()
            ],
          ),
        ),
      ),
    );
  }
}

class CourseItemGrid extends StatelessWidget {
  const CourseItemGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap:
            true, // Adjusts the GridView height according to its content
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 40.0, // Spacing between columns
          mainAxisSpacing: 40.0, // Spacing between rows
        ),
        itemCount: 20, // Number of items in the GridView
        itemBuilder: (BuildContext context, int index) {
          return appImage();
        },
      ),
    );
  }
}
