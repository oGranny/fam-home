import 'package:flutter/widgets.dart';

class FormattedText {
  final String text;
  final TextAlign? align;
  final List<TextEntity> entities;

  FormattedText({required this.text, this.align, required this.entities});

  factory FormattedText.fromJson(Map<String, dynamic> json) {
    return FormattedText(
      text: json['text'] as String,
      align:
          json['align'] != null
              ? {
                "left": TextAlign.left,
                "right": TextAlign.right,
                "center": TextAlign.center,
                "justify": TextAlign.justify,
              }[json['align']]
              : TextAlign.left,
      entities:
          (json['entities'] as List)
              .map((entity) => TextEntity.fromMap(entity))
              .toList(),
    );
  }
}

class TextEntity {
  final String? text;
  final String type;
  final Color? color;
  final double? fontSize;
  final String? fontStyle;
  final FontWeight? fontWeight;

  TextEntity({
    required this.type,
    this.text,
    this.color,
    this.fontSize,
    this.fontStyle,
    this.fontWeight,
  });

  factory TextEntity.fromMap(Map<String, dynamic> map) {
    return TextEntity(
      type: map['type'],
      text: map['text'],
      color:
          map['color'] != null
              ? Color(
                int.parse(map['color'].substring(1), radix: 16) + 0xFF000000,
              )
              : null,
      fontSize: map['font_size']?.toDouble(),
      fontStyle: map['font_style'],
      fontWeight:
          map['font_family'] == "met_semi_bold"
              ? FontWeight.w600
              : FontWeight.normal,
    );
  }
}
