import 'package:courseguh/common/models/course_entites.dart';
import 'package:courseguh/common/services/http_util.dart';

class CourseDetailRepo {
  static Future<CourseDetailResponseEntity> courseDetail(
      {required CourseRequestEntity params}) async {
    var response = await HttpUtil()
        .post("api/courseDetail", queryParameters: params.toJson());

    return CourseDetailResponseEntity.fromJson(response);
  }
}
