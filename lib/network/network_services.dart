import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkServices {
  late String keyWord;
  NetworkServices({
    required this.keyWord,
  });

  Future<Map<String, dynamic>?> getRequest() async {
    Uri uri = Uri.parse("https://itunes.apple.com/search?term=${keyWord}");

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }
}
