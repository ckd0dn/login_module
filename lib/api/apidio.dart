import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:login/api/api.dart';




class ApiDio_Get{


  // final serviceUrl = 'http://210.217.150.148:8080/';
  // final serviceUrl = 'http://106.245.253.186:8080/';


  final String url;
  final String token;


  ApiDio_Get(this.url, this.token);

  connect() async {
    BaseOptions options = BaseOptions(
      baseUrl: Api.serviceUrl,
      connectTimeout: 10000,
      receiveTimeout: 10000,
        headers: {'Authorization':'Bearer $token',
        }
    );

    Dio dio = new Dio(options);

    Response response = await dio.get(this.url);

    return response;
  }

    // Response response = await dio.post(this.url, data: this.formData);
}

class ApiDio_Post{

  final String url;
  final Map<String, dynamic> data;

  ApiDio_Post(this.url, this.data);


  connect() async {
    BaseOptions options = BaseOptions(
      baseUrl: Api.serviceUrl,
      connectTimeout: 10000,
      receiveTimeout: 10000,

    );

    Dio dio = new Dio(options);

    Response response = await dio.post(this.url, data: this.data);
    return response;
  }

// Response response = await dio.post(this.url, data: this.formData);
}

class ApiDio_Post_token{

  final String token;
  final String url;
  final Map<String, dynamic> data;

  ApiDio_Post_token(this.url, this.data, this.token);


  connect() async {
    BaseOptions options = BaseOptions(
      baseUrl: Api.serviceUrl,
      connectTimeout: 10000,
      receiveTimeout: 10000,
        headers: {'Authorization':'Bearer $token',
        }
    );

    Dio dio = Dio(options);

    Response response = await dio.post(url, data: data);
    return response;
  }

// Response response = await dio.post(this.url, data: this.formData);
}

class ApiDio_Post_Form{

  // final serviceUrl = 'http://106.245.253.186:8080/';
  // final serviceUrl = 'http://210.217.150.131:8080/';
  // final serviceUrl = 'http://210.217.150.148:8080/';

  final String url;
  final String token;
  final FormData formData;

  ApiDio_Post_Form(this.url, this.formData, this.token);

  connect() async {
    BaseOptions options = BaseOptions(
      baseUrl: Api.serviceUrl,
      connectTimeout: 10000,
      receiveTimeout: 10000,
      headers: {'Authorization':'Bearer $token',
                }

    );

    Dio dio = new Dio(options);
    Response response = await dio.post(this.url, data: this.formData);
    return response;
  }

// Response response = await dio.post(this.url, data: this.formData);
}

class ApiDio_Patch{

  final String token;
  final String url;
  final Map<String, dynamic> data;

  ApiDio_Patch(this.url, this.data, this.token );


  connect() async {
    BaseOptions options = BaseOptions(
      baseUrl: Api.serviceUrl,
      connectTimeout: 10000,
      receiveTimeout: 10000,
        headers: {'Authorization':'Bearer $token',
        }
    );

    Dio dio = new Dio(options);

    Response response = await dio.patch(this.url, data: this.data);
    return response;
  }

// Response response = await dio.post(this.url, data: this.formData);
}

class ApiDio_Delete{

  final String url;
  final Map<String, dynamic> data;

  ApiDio_Delete(this.url, this.data);


  connect() async {
    BaseOptions options = BaseOptions(
      baseUrl: Api.serviceUrl,
      connectTimeout: 10000,
      receiveTimeout: 10000,

    );

    Dio dio = Dio(options);

    Response response = await dio.delete(url, data: data);
    return response;
  }

// Response response = await dio.post(this.url, data: this.formData);
}