import 'package:fam_home/entities/formatted_text.dart';
import 'package:flutter/material.dart';

class FamRichText extends StatelessWidget {
  final FormattedText formattedText;
  const FamRichText({super.key, required this.formattedText});

  @override
  Widget build(BuildContext context) {
    final parts = formattedText.text.split("{}");
    final spans = <InlineSpan>[];
    int entityIndex = 0;
    for (int i = 0; i < parts.length; i++) {
      final plain = parts[i];
      if (plain.isNotEmpty) {
        spans.add(
          TextSpan(
            text: plain,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }
      if (entityIndex < formattedText.entities.length) {
        final e = formattedText.entities[entityIndex++];
        spans.add(
          TextSpan(
            text: e.text ?? "",
            style: TextStyle(
              color: e.color ?? Colors.black,
              fontSize: e.fontSize,
              fontWeight: e.fontWeight,
            ),
          ),
        );
      }
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxWidth: constraints.maxWidth),
          child: RichText(
            textAlign: formattedText.align ?? TextAlign.left,
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: spans,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
          ),
        );
      },
    );
  }
}
