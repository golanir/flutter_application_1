import 'package:http/http.dart' as http;

class HttpService {
  Future<String> getData({
    required String url,
    required Duration pullDuration,
  }) async {
    Map<String, String> headers = {"Accept": "text/html,application/xml"};
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
