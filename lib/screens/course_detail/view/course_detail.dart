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
    args = ModalRoute.of(context)!.settings.arguments as Map;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
