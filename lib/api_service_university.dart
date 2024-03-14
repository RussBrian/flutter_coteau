// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'university_class.dart';

Future<List<University>> fetchUniversities(String country) async {
  final response = await http.get(Uri.parse('http://universities.hipolabs.com/search?country=$country'));
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((e) => University.fromJson(e)).toList();
  } else {
    return [];
  }
}
