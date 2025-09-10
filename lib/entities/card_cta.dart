import 'package:flutter/material.dart';

class CardCta {
  final String text;
  final String type;
  final Color? color;
  final bool? isCircular;
  final int? strokeWidth;
  final bool? isSecondary;

  CardCta({
    required this.text,
    required this.type,
    this.color,
    this.isCircular,
    this.strokeWidth,
    this.isSecondary,
  });

  factory CardCta.fromJson(Map<String, dynamic> json) {
    return CardCta(
      text: json['text'] as String,
      type: json['type'] as String,
      color:
          json['bg_color'] != null
              ? Color(
                int.parse(json['bg_color'].substring(1), radix: 16) +
                    0xFF000000,
              )
              : null,
      isCircular: json['is_circular'] as bool?,
      strokeWidth: json['stroke_width'] as int?,
      isSecondary: json['is_secondary'] as bool?,
    );
  }
}
