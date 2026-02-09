import 'package:dio/dio.dart';

class NetworkManager {
  static NetworkManager? _instace;
  static NetworkManager get instance {
    if (_instace != null) return _instace!;
    _instace = NetworkManager._init();
    return _instace!;
  }

  final String _baseUrl = 'your base url'; //example: http://your_ip:8000/
  late final Dio dio;

  NetworkManager._init() {
    dio = Dio(BaseOptions(
        baseUrl: _baseUrl, headers: {'Content-Type': 'application/json'}));
  }
}
