import 'package:courseguh/common/models/course_entites.dart';
import 'package:courseguh/common/services/http_util.dart';

class CourseAPI {
  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().post('api/courseList');

    return CourseListResponseEntity.fromJson(response);
  }
}
