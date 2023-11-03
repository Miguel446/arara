class News {
  final String id;
  final String title;
  final String content;
  final String source;
  final DateTime createdAt;
  final String? imageUrl;
  final String? url;
  final bool isHighlight;

  News({
    required this.id,
    required this.title,
    required this.content,
    required this.source,
    required this.createdAt,
    this.imageUrl,
    this.url,
    required this.isHighlight,
  });
}
