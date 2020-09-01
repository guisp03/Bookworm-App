import 'package:http_interceptor/http_interceptor.dart';
import 'package:teste/models/leitor.dart';
import 'dart:convert';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('Request');
    print('url: ${data.baseUrl}');
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
  requestTimeout: Duration(seconds: 5),
);

const String baseUrl = 'https://10.0.2.2:44360/';

class Login {
  String oi = jsonEncode(Leitor("@email", "123").toJson());
    void login() async {
     var response = await client.post(baseUrl, body: oi);
     if (response.statusCode == 200) {
       print(response);
     }
   }
}
