import 'package:flutter/material.dart';

class CardGradient {
  final int angle;
  final List<Color> colors;

  CardGradient({required this.angle, required this.colors});

  factory CardGradient.fromJson(Map<String, dynamic> json) {
    return CardGradient(
      angle: json['angle'],
      colors:
          (json['colors'] as List)
              .map(
                (color) => Color(
                  int.parse(color.substring(1), radix: 16) + 0xFF000000,
                ),
              )
              .toList(),
    );
  }
}
