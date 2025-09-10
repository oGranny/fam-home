import 'package:fam_home/entities/base_card.dart';

abstract class CardGroup {
  final int id;
  final String name;
  final String designType;
  final int cardType;
  final String slug;
  final String isScrollable;
  final String isFullWidth;
  final int level;
  final int? height;
  final List<BaseCard> cards;

  CardGroup({
    required this.id,
    required this.name,
    required this.designType,
    required this.cardType,
    required this.slug,
    required this.isScrollable,
    required this.isFullWidth,
    required this.level,
    this.height,
    required this.cards,
  });
}
