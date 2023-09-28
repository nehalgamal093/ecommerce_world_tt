import 'package:http/http.dart' as http;
import 'dart:convert';

class GetLists {
  Future<List<dynamic>> getLists(String url) async {
    final response = await http.get(
      Uri.parse(url),
    );
    var data = json.decode(response.body)['result'];
    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception('Failed');
    }
  }
}
