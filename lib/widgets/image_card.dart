import 'package:fam_home/entities/base_card.dart';
import 'package:fam_home/entities/card_group.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HC5Container extends StatelessWidget {
  final CardEntity cardGroup;
  const HC5Container({super.key, required this.cardGroup});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: HC5Card(cardData: cardGroup.cards.first),
    );
  }
}

class HC5Card extends StatelessWidget {
  final BaseCard cardData;
  const HC5Card({super.key, required this.cardData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!cardData.isDisabled && cardData.url != null) {
          Uri url = Uri.parse(cardData.url!);
          launchUrl(url);
        }
      },
      child: Image.network(cardData.bgImage!.url),
    );
  }
}
