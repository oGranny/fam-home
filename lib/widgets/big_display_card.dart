import 'package:fam_home/entities/base_card.dart';
import 'package:fam_home/widgets/action_button.dart';
import 'package:fam_home/widgets/fam_rich_text.dart';
import 'package:fam_home/widgets/hidden_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HC3Card extends StatefulWidget {
  final BaseCard cardData;

  const HC3Card({super.key, required this.cardData});

  @override
  State<HC3Card> createState() => _HC3CardState();
}

class _HC3CardState extends State<HC3Card> {
  bool _shiftTriggered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double aspectRatio =
              widget.cardData.bgImage?.aspectRatio ?? 1.0;
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HiddenButton(
                      text: "remind later",
                      icon: Image.asset("assets/bell_icon.png"),
                      onPressed: () {
                        // Handle button press
                      },
                    ),
                    HiddenButton(
                      text: "Hidden",
                      icon: Image.asset("assets/close_icon.png"),
                      onPressed: () {
                        // Handle button press
                      },
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
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
                      color: widget.cardData.bgColor ?? Colors.transparent,
                      image:
                          widget.cardData.bgImage?.url != null
                              ? DecorationImage(
                                image: NetworkImage(
                                  widget.cardData.bgImage!.url,
                                ),
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
                            onPressed: () {
                              if (widget.cardData.url != null) {
                                final Uri url = Uri.parse(widget.cardData.url!);
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
      ),
    );
  }
}
