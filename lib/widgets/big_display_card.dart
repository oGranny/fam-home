import 'package:fam_home/entities/base_card.dart';
import 'package:fam_home/widgets/action_button.dart';
import 'package:fam_home/widgets/fam_rich_text.dart';
import 'package:flutter/material.dart';

class HC3Card extends StatelessWidget {
  final BaseCard cardData;
  const HC3Card({super.key, required this.cardData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double aspectRatio = cardData.bgImage?.aspectRatio ?? 1.0;
          final double width = constraints.maxWidth;
          final double height = width / aspectRatio;
          return Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: cardData.bgColor ?? Colors.transparent,
              image:
                  cardData.bgImage?.url != null
                      ? DecorationImage(
                        image: NetworkImage(cardData.bgImage!.url),
                        fit: BoxFit.fill,
                      )
                      : null,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 33.0,
                vertical: 20.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FamRichText(formattedText: cardData.formattedTitle!),
                  SizedBox(height: height * 0.10),
                  ActionButton(cta: cardData.cta![0]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
