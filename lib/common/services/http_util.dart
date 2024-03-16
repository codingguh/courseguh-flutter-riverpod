import 'package:courseguh/common/utils/constants.dart';
import 'package:courseguh/global.dart';
import 'package:dio/dio.dart';

class HttpUtil {
  late Dio dio;

  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
        baseUrl: AppConstants.SERVER_API_URL,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: {},
        contentType: "application/json charset=utf-8",
        responseType: ResponseType.json);

    dio = Dio(options);
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      print("app response data ${response.data}");
      return handler.next(response);
    }, onError: (DioException e, handler) {
      ErrorEntity eInfo = createErrorEntity(e);
      onError(eInfo);
    }));
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }

  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    // EasyLoading.show(indicator: CircularProgressIndicator(),maskType: EasyLoadingMaskType.clear,dismissOnTap: true);
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      // cancelToken: cancelToken,
    );
    // EasyLoading.dismiss();
    return response.data;
  }
}

class ErrorEntity implements Exception {
  int code = -1;
  String message = "";
  ErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    if (message == "") return "Exception";
    return "Exception code $code, $message";
  }
}

ErrorEntity createErrorEntity(DioException error) {
  switch (error.type) {
    case DioExceptionType.cancel:
      return ErrorEntity(code: 101, message: "Request to cancel");
    case DioExceptionType.connectionTimeout:
      return ErrorEntity(code: 102, message: "request to connection time out");
    case DioExceptionType.sendTimeout:
      return ErrorEntity(code: 103, message: "request to send time out");
    case DioExceptionType.receiveTimeout:
      return ErrorEntity(code: 104, message: "request to receive time out");
    case DioExceptionType.connectionError:
      return ErrorEntity(code: 105, message: "request to connection error");
    case DioExceptionType.badCertificate:
      return ErrorEntity(code: 106, message: "request to bad certificate");
    case DioExceptionType.unknown:
      return ErrorEntity(code: 107, message: "request to unknown");
    case DioExceptionType.badResponse:
      print("bad response......");
      {
        try {
          int errCode =
              error.response != null ? error.response!.statusCode! : -1;
          switch (errCode) {
            case 400:
              print("bad response 400......");
              return ErrorEntity(
                  code: errCode, message: "request syntax error");
            case 401:
              print("bad response 401......");
              return ErrorEntity(code: errCode, message: "permission denied");
            case 403:
              print("bad response 403......");
              return ErrorEntity(
                  code: errCode, message: "The server refuses to execute");
            case 404:
              print("bad response 404......");
              return ErrorEntity(
                  code: errCode, message: "can not connect to the server");
            case 405:
              print("bad response 405......");
              return ErrorEntity(
                  code: errCode, message: "request method is forbidden");
            case 500:
              print("bad response 500......");
              return ErrorEntity(
                  code: errCode, message: "internal server error");
            case 502:
              print("bad response 502......");
              return ErrorEntity(code: errCode, message: "invalid request");
            case 503:
              print("bad response 503......");
              return ErrorEntity(code: errCode, message: "server down");
            case 505:
              print("bad response 505......");
              return ErrorEntity(
                  code: errCode,
                  message: "Does not support HTTP protocol requests");
            default:
              return ErrorEntity(
                  code: errCode,
                  message: error.response != null
                      ? error.response!.statusMessage!
                      : "");
          }
        } on Exception catch (_) {
          return ErrorEntity(code: 108, message: "unknown mistake");
        }
      }
    default:
      {
        return ErrorEntity(
            code: -1,
            message:
                error.response != null ? error.response!.statusMessage! : "");
      }
  }
}

void onError(ErrorEntity eInfo) {
  print('error.code -> ' +
      eInfo.code.toString() +
      ', error.message -> ' +
      eInfo.message);
  switch (eInfo.code) {
    case 400:
      print("Server sintax error");
      break;
    case 401:
      print("You are denied to continue");
      break;
    case 500:
      print("Internal server error");
      break;
    // Global.storageService.remove(STORAGE_USER_PROFILE_KEY);
    // Global.storageService.remove(STORAGE_USER_TOKEN_KEY);
    // if (Global.navigatorKey.currentContext != null) {
    //   Navigator.of(Global.navigatorKey.currentContext!)
    //       .pushNamedAndRemoveUntil(
    //           AppRoutes.Sign_in, (Route<dynamic> route) => false);
    // }
    // EasyLoading.showError("Token expired, do log in again！");

    default:
      print("Unknown error");
      // EasyLoading.showError('unknown mistake');
      break;
  }
}
