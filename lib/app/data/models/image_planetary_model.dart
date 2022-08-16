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
      url: json['url'] ??
          'https://thumbs.dreamstime.com/z/error-message-creative-design-48389035.jpg',
      title: json['title'] ?? 'Erro ao obter o nome',
      date: json['date'] ?? 'Não informado',
      explanation: json['explanation'] ?? 'Não informado',
      copyright: json['copyright'] ?? 'Não informado',
    );
  }
}
