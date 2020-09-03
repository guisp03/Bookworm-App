import 'package:http_interceptor/http_interceptor.dart';
import 'dart:convert';
import 'package:http/http.dart';

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

const String baseUrl = 'https://192.168.0.6:45456/';

class Login {
  String oi = jsonEncode({"Email": "@email", "Senha":"123"});
    Future<int> login() async {
     Response response = await client.post(baseUrl,body: oi);
     if (response.statusCode == 200) {
       return json.decode(response.body);
     }
     else{
       return 0;
     }
   }
}
