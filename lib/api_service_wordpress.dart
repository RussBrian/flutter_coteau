// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'news.dart';

class NewsFetcher {
  Future<List<News>> fetchNews() async {
    final response =
        await http.get(Uri.parse('https://www.renaultgroup.com/wp-json/wp/v2/posts/'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<dynamic> lastThreePosts = data.take(3).toList();
      return lastThreePosts.map((e) => News.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
