import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@LazySingleton()
class MainApi {
  http.Client get client => http.Client();
}
