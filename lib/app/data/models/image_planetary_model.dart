class ImageUniverse {
  final String url;
  final String title;
  final String date;
  final String explanation;
  final String? copyright;

  ImageUniverse({
    required this.url,
    required this.title,
    required this.date,
    required this.explanation,
    this.copyright,
  });

  factory ImageUniverse.fromJson(Map<String, dynamic> json) {
    return ImageUniverse(
      url: json['url'],
      title: json['title'],
      date: json['date'],
      explanation: json['explanation'],
      copyright: json['copyright'] ?? 'Não informado',
    );
  }
}
