// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServiceAge {
  static Future<int> fetchAge(String name) async {
    final uri = Uri.parse('https://api.agify.io/?name=$name');
    final response = await http.get(uri);
    final decodedResponse = json.decode(response.body);
    return decodedResponse['age'];
  }
}
