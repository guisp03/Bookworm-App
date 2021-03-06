import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('Request');
    print('url: ${data.url}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print('Response');
    print('status code: ${data.statusCode}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }
}

final HttpClientWithInterceptor client = HttpClientWithInterceptor.build(
  interceptors: [LoggingInterceptor()],
  badCertificateCallback: ((x509Certificate, String host, int port) => true),
  requestTimeout: Duration(seconds: 5),
);

const String baseUrl = 'http://192.168.0.9:45455/';
