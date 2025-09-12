import 'package:fam_home/entities/base_card.dart';
import 'package:fam_home/entities/card_group.dart';
import 'package:fam_home/widgets/fam_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HC1Container extends StatelessWidget {
  final CardEntity cardGroup;
  const HC1Container({super.key, required this.cardGroup});

  int get level => cardGroup.level;
  int get id => cardGroup.id;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: cardGroup.height?.toDouble(),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      height:
          cardGroup.height?.toDouble() != null
              ? (cardGroup.height! * 1.5)
              : null,
      child: HC1Card(cardData: cardGroup.cards[0]),
    );
  }
}

class HC1Card extends StatelessWidget {
  final BaseCard cardData;
  const HC1Card({super.key, required this.cardData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!cardData.isDisabled) {
          Uri url = Uri.parse(cardData.url!);
          launchUrl(url);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: cardData.bgColor ?? Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              cardData.icon!.url,
              width:
                  cardData.iconSize?.toDouble() != null
                      ? cardData.iconSize!.toDouble() * 2.5
                      : null,
              height:
                  cardData.iconSize?.toDouble() != null
                      ? cardData.iconSize!.toDouble() * 2.5
                      : null,
              fit: BoxFit.cover,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FamRichText(
                    formattedText: cardData.formattedTitle!,
                    allowedLines: 1,
                  ),
                  FamRichText(
                    formattedText: cardData.formattedDescription!,
                    allowedLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
