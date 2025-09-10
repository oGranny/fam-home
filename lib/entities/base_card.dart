import 'package:fam_home/entities/card_cta.dart';
import 'package:fam_home/entities/card_gradient.dart';
import 'package:fam_home/entities/card_icon.dart';
import 'package:fam_home/entities/formatted_text.dart';
import 'package:flutter/material.dart';

class BaseCard {
  final int id;
  final String name;
  final String slug;
  final String title;
  final FormattedText? formattedTitle;
  final FormattedText? formattedDescription;
  final CardGraphic? icon;
  final int? iconSize;
  final List<dynamic> positionalImages;
  final List<dynamic> components;
  final String? url;
  final CardGraphic? bgImage;
  final CardGradient? bgGradient;
  final Color? bgColor;
  final List<CardCta>? cta;
  final bool isDisabled;
  final bool isShareable;
  final bool isInternal;

  BaseCard({
    required this.id,
    required this.name,
    required this.slug,
    required this.title,
    this.formattedTitle,
    required this.positionalImages,
    required this.components,
    required this.url,
    this.bgImage,
    required this.cta,
    required this.isDisabled,
    required this.isShareable,
    required this.isInternal,
    this.formattedDescription,
    this.icon,
    this.iconSize,
    this.bgGradient,
    this.bgColor,
  });

  factory BaseCard.fromJson(Map<String, dynamic> json) {
    return BaseCard(
      id: json['id'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      title: json['title'] ?? "",
      formattedTitle:
          json['formatted_title'] != null
              ? FormattedText.fromJson(json['formatted_title'])
              : null,
      formattedDescription:
          json['formatted_description'] != null
              ? FormattedText.fromJson(json['formatted_description'])
              : null,
      icon: json['icon'] != null ? CardGraphic.fromJson(json['icon']) : null,
      iconSize: json['icon_size'] as int?,
      positionalImages: json['positional_images'] ?? [],
      components: json['components'] ?? [],
      url: json['url'] as String?,
      bgImage:
          json['bg_image'] != null
              ? CardGraphic.fromJson(json['bg_image'])
              : null,
      bgGradient:
          json['bg_gradient'] != null
              ? CardGradient.fromJson(json['bg_gradient'])
              : null,
      bgColor:
          json['bg_color'] != null
              ? Color(
                int.parse(json['bg_color'].substring(1), radix: 16) +
                    0xFF000000,
              )
              : null,
      cta:
          json['cta'] != null
              ? (json['cta'] as List)
                  .map((cta) => CardCta.fromJson(cta))
                  .toList()
              : null,
      isDisabled: json['is_disabled'] as bool,
      isShareable: json['is_shareable'] as bool,
      isInternal: json['is_internal'] as bool,
    );
  }
}
