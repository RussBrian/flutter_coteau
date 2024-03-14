class University {
  final String name;
  final String domain;
  final String website;

  University({required this.name, required this.domain, required this.website});

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      name: json['name'] ?? 'Unknown',
      domain: json['domains'][0] ?? 'Unknown',
      website: json['web_pages'][0] ?? 'Unknown',
    );
  }
}
