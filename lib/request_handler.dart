import 'package:http/http.dart';

class RequestHandler {
  static void exceptionHandler(Response response) {
    if (response == null) throw ('NoDataFound:');
    if (response.statusCode >= 400 && response.statusCode < 500)
      throw ('UserException:');
    else if (response.statusCode >= 500) throw ('ServerException:');
  }
}
