import 'package:fam_home/entities/base_card.dart';
import 'package:fam_home/entities/card_group.dart';
import 'package:fam_home/widgets/action_button.dart';
import 'package:fam_home/widgets/fam_rich_text.dart';
import 'package:fam_home/widgets/hidden_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class HC3Container extends StatefulWidget {
  final CardEntity cardGroup;
  final VoidCallback? onDismiss;
  const HC3Container({super.key, required this.cardGroup, this.onDismiss});
  int get level => cardGroup.level;
  int get id => cardGroup.id;

  @override
  State<HC3Container> createState() => _HC3ContainerState();
}

class _HC3ContainerState extends State<HC3Container> {
  void onCardRemoved(int index, PageController pageController) async {
    if (widget.cardGroup.cards.length == 1) {
      widget.onDismiss!();
    } else {
      int newIndex =
          index < widget.cardGroup.cards.length - 1 ? index + 1 : index - 1;
      await pageController.animateTo(
        pageController.position.viewportDimension * newIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        widget.cardGroup.cards.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    return SizedBox(
      width: widget.cardGroup.isFullWidth ? double.infinity : null,
      child:
          widget.cardGroup.cards.length > 1 && widget.cardGroup.isScrollable
              ? AspectRatio(
                aspectRatio:
                    widget.cardGroup.cards[0].bgImage!.aspectRatio + .05,
                child: PageView.builder(
                  controller: pageController,
                  physics: ClampingScrollPhysics(),
                  itemCount: widget.cardGroup.cards.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: HC3Card(
                          cardData: widget.cardGroup.cards[index],
                          onDismiss: () => onCardRemoved(index, pageController),
                        ),
                      ),
                    );
                  },
                ),
              )
              : Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 8.0,
                ),
                child: HC3Card(
                  cardData: widget.cardGroup.cards[0],
                  onDismiss: widget.onDismiss,
                ),
              ),
    );
  }
}

class HC3Card extends StatefulWidget {
  final BaseCard cardData;
  final VoidCallback? onDismiss;

  const HC3Card({super.key, required this.cardData, this.onDismiss});

  @override
  State<HC3Card> createState() => _HC3CardState();
}

class _HC3CardState extends State<HC3Card> {
  bool _shiftTriggered = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double aspectRatio = widget.cardData.bgImage?.aspectRatio ?? 1.0;
        final double width = constraints.maxWidth;
        final double height = width / aspectRatio;

        return Stack(
          children: [
            Container(
              width: width / 2.5,
              height: height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.07),
                    child: HiddenButton(
                      text: "remind later",
                      icon: Image.asset("assets/bell_icon.png"),
                      onPressed: () async {
                        if (widget.onDismiss != null) {
                          setState(() {
                            _shiftTriggered = !_shiftTriggered;
                          });
                          widget.onDismiss!();
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.07),
                    child: HiddenButton(
                      text: "dismiss now",
                      icon: Image.asset("assets/close_icon.png"),
                      onPressed: () async {
                        setState(() {
                          _shiftTriggered = !_shiftTriggered;
                        });
                        final prefs = await SharedPreferences.getInstance();
                        final id = widget.cardData.id.toString();
                        final list =
                            prefs.getStringList('dismissed_cards') ??
                            <String>[];
                        if (!list.contains(id)) list.add(id);
                        await prefs.setStringList('dismissed_cards', list);

                        if (!mounted) return;
                        widget.onDismiss?.call();
                      },
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onLongPress: () {
                setState(() {
                  _shiftTriggered = !_shiftTriggered;
                });
              },
              child: AnimatedSlide(
                offset: _shiftTriggered ? const Offset(0.40, 0) : Offset.zero,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: Container(
                  width: width,
                  height: height,

                  decoration: BoxDecoration(
                    color: widget.cardData.bgColor ?? Colors.grey,
                    image:
                        widget.cardData.bgImage?.url != null
                            ? DecorationImage(
                              image: NetworkImage(widget.cardData.bgImage!.url),
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
                        FamRichText(
                          formattedText: widget.cardData.formattedTitle!,
                        ),
                        SizedBox(height: height * 0.10),
                        ActionButton(
                          cta: widget.cardData.cta![0],
                          onPressed:
                              widget.cardData.isDisabled
                                  ? null
                                  : () {
                                    if (widget.cardData.url != null) {
                                      final Uri url = Uri.parse(
                                        widget.cardData.url!,
                                      );
                                      launchUrl(url);
                                    }
                                  },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
