import 'package:fam_home/entities/base_card.dart';
import 'package:fam_home/entities/card_group.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class HC5Container extends StatelessWidget {
  final CardEntity cardGroup;
  const HC5Container({super.key, required this.cardGroup});
  int get level => cardGroup.level;
  int get id => cardGroup.id;

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    return SizedBox(
      width: cardGroup.isFullWidth ? double.infinity : null,
      child:
          cardGroup.cards.length > 1 && cardGroup.isScrollable
              ? AspectRatio(
                aspectRatio: cardGroup.cards[0].bgImage!.aspectRatio + .05,
                child: PageView.builder(
                  controller: pageController,
                  physics: ClampingScrollPhysics(),
                  itemCount: cardGroup.cards.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: HC5Card(cardData: cardGroup.cards[index]),
                      ),
                    );
                  },
                ),
              )
              : cardGroup.cards.length > 1 && !cardGroup.isScrollable
              ? ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cardGroup.cards.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 8.0,
                    ),
                    child: HC5Card(cardData: cardGroup.cards[index]),
                  );
                },
              )
              : Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 8.0,
                ),
                child: HC5Card(cardData: cardGroup.cards[0]),
              ),
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
      onLongPress: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setStringList('dismissed_cards', []);
      },
      child: Image.network(cardData.bgImage!.url),
    );
  }
}
