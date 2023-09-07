class ArticlesModel {
  final String author;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String title;

  ArticlesModel({
    required this.author,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.title,
  });

  factory ArticlesModel.fromJson(Map<String, dynamic> json) {
    return ArticlesModel(
      author: json['author'] ?? '',
      description: json['description']?? '',
      url: json['url'] ??'https://play-lh.googleusercontent.com/8LYEbSl48gJoUVGDUyqO5A0xKlcbm2b39S32xvm_h-8BueclJnZlspfkZmrXNFX2XQ',
      urlToImage: json['urlToImage']?? '',
      publishedAt: json['publishedAt']?? '',
      title: json['title']?? '',
    );
  }
}
