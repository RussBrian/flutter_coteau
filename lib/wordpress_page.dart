
// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'news.dart';
import 'api_service_wordpress.dart';
import 'package:url_launcher/url_launcher.dart';

class WordPressNewsPage extends StatefulWidget {
  const WordPressNewsPage({super.key});

  @override
  _WordPressNewsPageState createState() => _WordPressNewsPageState();
}

class _WordPressNewsPageState extends State<WordPressNewsPage> {
  late List<News> _newsList = [];

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    final newsFetcher = NewsFetcher();
    final news = await newsFetcher.fetchNews();
    setState(() {
      _newsList = news;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WordPress - Renault'),
      ),
      body: _newsList.isNotEmpty
          ? ListView.builder(
              itemCount: _newsList.length,
              itemBuilder: (context, index) {
                final news = _newsList[index];
                return ListTile(
                  title: Text(news.title),
                  subtitle: Text(news.summary),
                  onTap: () => _launchURL(news.url),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo encontrar $url';
    }
  }
}
