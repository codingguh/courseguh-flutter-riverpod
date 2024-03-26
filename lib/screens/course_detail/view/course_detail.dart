import 'package:courseguh/screens/course_detail/controller/course_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseDetail extends ConsumerStatefulWidget {
  const CourseDetail({super.key});

  @override
  ConsumerState<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends ConsumerState<CourseDetail> {
  late var args;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    var id = ModalRoute.of(context)!.settings.arguments as Map;

    args = id["id"];

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var stateData =
        ref.watch(courseDetailControllerProvider(index: args.toInt()));
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
