import 'package:fam_home/entities/base_card.dart';
import 'package:fam_home/entities/card_group.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HC9Container extends StatelessWidget {
  final CardEntity cardGroup;
  const HC9Container({super.key, required this.cardGroup});
  int get level => cardGroup.level;
  int get id => cardGroup.id;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20.0, 8.0, 0, 8.0),
      height: cardGroup.height! * 1.2 + 16.0, // padding + content height
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cardGroup.cards.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: HC9Card(
              cardData: cardGroup.cards[index],
              height: cardGroup.height! * 1.2,
            ),
          );
        },
      ),
    );
  }
}

class HC9Card extends StatelessWidget {
  final BaseCard cardData;
  final double height;
  const HC9Card({super.key, required this.cardData, required this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!cardData.isDisabled && cardData.url != null) {
          Uri url = Uri.parse(cardData.url!);
          launchUrl(url);
        }
      },
      child: SizedBox(
        height: height.toDouble(),
        width: height.toDouble() * cardData.bgImage!.aspectRatio,
        child: Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              transform: GradientRotation(
                cardData.bgGradient!.angle * 3.14 / 180,
              ),
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: cardData.bgGradient!.colors,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.network(cardData.bgImage!.url, fit: BoxFit.fitHeight),
        ),
      ),
    );
  }
}
