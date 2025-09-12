class CardGraphic {
  final String url;
  final String imageType;
  final double aspectRatio;

  CardGraphic({
    required this.url,
    required this.imageType,
    required this.aspectRatio,
  });

  factory CardGraphic.fromJson(Map<String, dynamic> json) {
    return CardGraphic(
      url: json['image_url'] as String,
      imageType: json['image_type'] as String,
      aspectRatio: (json['aspect_ratio'] as num).toDouble(),
    );
  }
}
