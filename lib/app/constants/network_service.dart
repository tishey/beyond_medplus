

// import 'package:dio/dio.dart';

// class APIService {
//   Ref ref;
//   final Dio _dio;
//   APIService(this.ref)
//       : _dio = Dio(BaseOptions(
//             connectTimeout: const Duration(seconds: 20),
//             receiveTimeout: const Duration(seconds: 20),
//             baseUrl: baseUrl,
//             responseType: ResponseType.json,
//             headers: {
//               'Accept': 'application/json',
//               'Content-Type': 'application/json',
//             })) {
//     final sharedPreferences = ref.read(sharedPreferenceProvider);
//     _dio.interceptors.add(
//       AuthInterceptor(sharedPreferences, ref),
//     );
//   }

//   Future<Map<String, dynamic>> get(String path,
//       {data,
//       Map<String, dynamic>? queryParameters,
//       CancelToken? cancelToken,
//       SharedPreferences? preferences,
//       ProgressCallback? onReceiveProgress}) async {
//     try {
//       final Response response = await _dio.get(
//         path,
//         data: data,
//         queryParameters: queryParameters,
//         cancelToken: cancelToken,
//         onReceiveProgress: onReceiveProgress,
//       );
//       if (response.statusCode == 200) {
//         return response.data;
//       }
//       throw "something went wrong";
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<Map<String, dynamic>> post(String path,
//       {data,
//       Map<String, dynamic>? queryParameters,
//       CancelToken? cancelToken,
//       ProgressCallback? onSendProgress,
//       ProgressCallback? onReceiveProgress}) async {
//     try {
//       final Response response = await _dio.post(
//         path,
//         data: data,
//         queryParameters: queryParameters,
//         cancelToken: cancelToken,
//         onSendProgress: onSendProgress,
//         onReceiveProgress: onReceiveProgress,
//       );
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return response.data;
//       }
//       throw "something went wrong";
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<Map<String, dynamic>> put(String path,
//       {data,
//       Map<String, dynamic>? queryParameters,
//       Options? options,
//       CancelToken? cancelToken,
//       ProgressCallback? onSendProgress,
//       ProgressCallback? onReceiveProgress}) async {
//     try {
//       final Response response = await _dio.put(
//         path,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//         onSendProgress: onSendProgress,
//         onReceiveProgress: onReceiveProgress,
//       );
//       if (response.statusCode == 200) {
//         return response.data;
//       }
//       throw "something went wrong";
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> delete(String path,
//       {data,
//       Map<String, dynamic>? queryParameters,
//       Options? options,
//       CancelToken? cancelToken,
//       ProgressCallback? onSendProgress,
//       ProgressCallback? onReceiveProgress}) async {
//     try {
//       final Response response = await _dio.delete(
//         path,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//       );
//       if (response.statusCode == 204) {
//         return response.data;
//       }
//       throw "something went wrong";
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

// Future<void> handleUnauthorizedAccess(ref) async {
//   // ref.read(sharedPreferenceProvider).remove(persistToken);
// }
