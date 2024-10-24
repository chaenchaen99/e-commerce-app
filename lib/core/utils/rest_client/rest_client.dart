import 'package:dio/dio.dart';

//dio 를 사용하는 restclient singleton 클래스
class RestClient {
  final Dio _dio = Dio();

  static final RestClient _instance = RestClient._internal();

  Dio get getDio => _dio;

  factory RestClient() => _instance;

  RestClient._internal();
}
