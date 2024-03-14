class News {
  final String title;
  final String summary;
  final String url;

  News({
    required this.title,
    required this.summary,
    required this.url,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title']['rendered'],
      summary: json['excerpt']['rendered'],
      url: json['link'],
    );
  }
}
