import 'package:courseguh/screens/course_detail/repo/course_detail_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:courseguh/common/models/course_entites.dart';
part 'course_detail_controller.g.dart';

@riverpod
Future<CourseItem?> courseDetailController(CourseDetailControllerRef ref,
    {required int index}) async {
  CourseRequestEntity courseRequestEntity = CourseRequestEntity();
  courseRequestEntity.id = index;
  final response =
      await CourseDetailRepo.courseDetail(params: courseRequestEntity);
  if (response.code == 200) {
    return response.data;
  } else {
    print('request failed ${response.code}');
  }
  return null;
}
