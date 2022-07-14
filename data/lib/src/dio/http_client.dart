import 'dart:convert';
import 'dart:typed_data';

import 'package:data/src/prefs/prefs_provider.dart';
import 'package:domain/domain.dart';
import 'package:shared_dependencies/crypto.dart';
import 'package:shared_dependencies/dio.dart';
import 'package:shared_dependencies/network.dart';
import 'package:shared_dependencies/utils.dart';

class HttpClient {
  final Dio _dio;
  final PrefsProvider _prefsProvider;
  static const String _API_KEY = '9f40d4ad9040a038459af70e0aa6801f';
  static const String _API_SECRET = '378a01463883c3c136ee38e970fb5a74';

  HttpClient({required PrefsProvider prefsProvider, required String baseUrl})
      : _prefsProvider = prefsProvider,
        _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            /*headers: <String, dynamic>{
              'Accept-Charset': 'utf-8',
              'User-Agent': 'DartyFM'
            },*/
            contentType: Headers.formUrlEncodedContentType,
            responseType: ResponseType.json,
          ),
        )..interceptors.add(
            InterceptorsWrapper(
              onRequest:
                  (RequestOptions options, RequestInterceptorHandler handler) {
                options.queryParameters
                    .removeWhere((String key, dynamic value) => value == null);

                if (options.data == null) {
                  return handler.next(options);
                }

                if (options.data is Map) {
                  (options.data as Map<dynamic, dynamic>).removeWhere(
                      (dynamic key, dynamic value) => value == null);
                }

                return handler.next(options);
              },
              onResponse: (Response<dynamic> response,
                  ResponseInterceptorHandler handler) {
                if (isXml(response.data)) {
                  final PostResponseHelper postResponse =
                      PostResponseHelper.parse(response.data as String);

                  if (!postResponse.status) {
                    throw LastFMException.generate(response.data);
                  }
                } else {
                  if (response.data['error'] != null) {
                    throw LastFMException(
                        errorCode: response.data['error'].toString(),
                        description: response.data['message'].toString());
                  }
                }

                return handler.next(response);
              },
              onError: (DioError error, ErrorInterceptorHandler handler) async {
                if (error.type == DioErrorType.connectTimeout) {
                  throw NoInternetError('No internet connection');
                }

                if (error.type == DioErrorType.response) {
                  throw LastFMException.generate(error.response!.data);
                } else {
                  return handler.next(error);
                }
              },
            ),
          );

  Map<String, dynamic> _configureParameters(Map<String, dynamic> parameters) {
    parameters.forEach((String key, dynamic value) {
      if (value != null) {
        parameters[key] = formatUnicode(text: value);
      }
    });
    parameters['api_key'] = _API_KEY;
    return parameters;
  }

  Future<dynamic> get(
    String method, {
    required Map<String, dynamic> parameters,
  }) async {
    parameters['format'] = 'json';
    parameters = _configureParameters(parameters);
    print('get');
    parameters['method'] = method;
    parameters['api_sig'] = _getSignature(parameters);
    return (await _dio.get('', queryParameters: parameters)).data;
  }

  Future<dynamic> post(
    String method, {
    required Map<String, dynamic> parameters,
  }) async {
    print('post');
    parameters = _configureParameters(parameters);
    parameters['method'] = method;
    parameters['api_sig'] = _getSignature(parameters);
    return (await _dio.post('', data: parameters)).data;
  }

  String _getSignature(Map<String, dynamic> _parameters) {
    String signature = '';
    final List<String> sortedKeys = _parameters.keys.toList()..sort();

    for (final String key in sortedKeys) {
      signature += key;
      signature += _parameters[key] as String;
    }

    signature += _API_SECRET;

    final Uint8List content = const Utf8Encoder().convert(signature);
    final Digest digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}

String formatUnicode({required dynamic text}) {
  if (text is List<int>) {
    return utf8.decode(text);
  } else if (text is String) {
    return utf8.decode(utf8.encode(text));
  } else {
    return text.toString();
  }
}
