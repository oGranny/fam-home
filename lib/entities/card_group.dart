import 'package:fam_home/entities/base_card.dart';

class CardEntity {
  final int id;
  final String name;
  final String designType;
  final int cardType;
  final String? slug;
  final bool isScrollable;
  final bool isFullWidth;
  final int level;
  final int? height;
  final List<BaseCard> cards;

  CardEntity({
    required this.id,
    required this.name,
    required this.designType,
    required this.cardType,
    this.slug,
    required this.isScrollable,
    required this.isFullWidth,
    required this.level,
    this.height,
    required this.cards,
  });

  factory CardEntity.fromJson(Map<String, dynamic> json) {
    return CardEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      designType: json['design_type'] as String,
      cardType: json['card_type'] as int,
      slug: json['slug'] as String?,
      isScrollable: json['is_scrollable'] as bool,
      isFullWidth: json['is_full_width'] as bool,
      level: json['level'] as int,
      height: json['height'] != null ? ((json['height'] as num)).toInt() : null,
      cards:
          (json['cards'] as List)
              .map((card) => BaseCard.fromJson(card))
              .toList(),
    );
  }
}
