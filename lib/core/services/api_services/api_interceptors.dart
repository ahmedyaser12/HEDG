import 'end_points.dart';

// class ApiInterceptor extends Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     print('Auth check header ${locator<DioConsumer>(param1: true).isAuth}');
//     options.headers[ApiKey.token] =
//         CacheHelper().getData(key: ApiKey.token) != null
//             ? 'FOODAPI ${CacheHelper().getData(key: ApiKey.token)}'
//             : null;
//
//     super.onRequest(options, handler);
//   }
// }
