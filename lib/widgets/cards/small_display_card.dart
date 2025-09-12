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
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      height:
          cardGroup.height != null &&
                  (cardGroup.isScrollable && cardGroup.cards.length > 1)
              ? (cardGroup.height! * 1.5).toDouble()
              : (cardGroup.height! * 1.5).toDouble() *
                  (cardGroup.cards.length / 2).ceil(),
      child:
          (cardGroup.isScrollable || cardGroup.cards.length == 1)
              ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cardGroup.cards.length,
                itemBuilder: (context, index) {
                  return HC1Card(
                    cardData: cardGroup.cards[index],
                    isSingle: cardGroup.cards.length == 1,
                  );
                },
              )
              : LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2.5,
                    ),
                    itemCount: cardGroup.cards.length,
                    itemBuilder: (context, index) {
                      return HC1Card(
                        cardData: cardGroup.cards[index],
                        isSingle: false,
                      );
                    },
                  );
                },
              ),
    );
  }
}

class HC1Card extends StatelessWidget {
  final BaseCard cardData;
  final bool isSingle;
  const HC1Card({super.key, required this.cardData, required this.isSingle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!cardData.isDisabled) {
          Uri url = Uri.parse(cardData.url!);
          launchUrl(url);
        }
      },
      child: Padding(
        padding:
            isSingle
                ? const EdgeInsets.all(0.0)
                : const EdgeInsets.only(right: 12.0),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            constraints: BoxConstraints(
              maxWidth:
                  MediaQuery.of(context).size.width * (isSingle ? 0.9 : 0.7),
            ),
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FamRichText(
                              formattedText: cardData.formattedTitle!,
                              allowedLines: 1,
                            ),
                            if (cardData.formattedDescription != null)
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
