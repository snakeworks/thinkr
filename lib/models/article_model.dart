class ArticleModel {
  const ArticleModel({
    this.id,
    this.title,
    this.content,
    this.bannerUrl,
    this.createdAt
  });

  final String? id;
  final String? title;
  final String? content;
  final String? bannerUrl;
  final DateTime? createdAt;

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      bannerUrl: map['bannerUrl'],
      createdAt: DateTime.tryParse(map['createdAt'] ?? ''),
    );
  }
}