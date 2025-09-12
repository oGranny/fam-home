import 'package:fam_home/entities/base_card.dart';
import 'package:fam_home/entities/card_group.dart';
import 'package:fam_home/widgets/fam_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HC6Container extends StatelessWidget {
  final CardEntity cardGroup;
  const HC6Container({super.key, required this.cardGroup});
  int get level => cardGroup.level;
  int get id => cardGroup.id;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      height:
          cardGroup.height != null ? (cardGroup.height! * 3).toDouble() : null,
      child: HC6Card(cardData: cardGroup.cards.first),
    );
  }
}

class HC6Card extends StatelessWidget {
  final BaseCard cardData;
  const HC6Card({super.key, required this.cardData});

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
          // color: cardData.bgColor ?? Colors.white, // BG color does not match design
          color: Colors.white,
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FamRichText(formattedText: cardData.formattedTitle!),
                  Icon(Icons.arrow_forward_ios_rounded, color: Colors.black),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
