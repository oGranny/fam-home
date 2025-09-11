import 'package:fam_home/entities/base_card.dart';
import 'package:fam_home/entities/card_group.dart';
import 'package:fam_home/widgets/action_button.dart';
import 'package:fam_home/widgets/big_display_card.dart';
import 'package:fam_home/widgets/fam_app_bar.dart';
import 'package:fam_home/widgets/fam_rich_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  BaseCard sampleCard = BaseCard.fromJson({
    "id": 2,
    "name": "Test hcc",
    "slug": "Testhccwithaction",
    "title":
        "Big display card\nwith action\nThis is a sample text for the subtitle that you can add to contextual cards",
    "formatted_title": {
      "text": "{}\nwith action\n{}",
      "align": "left",
      "entities": [
        {
          "text": "Big display card",
          "type": "generic_text",
          "color": "#FBAF03",
          "font_size": 30,
          "font_style": "underline",
          "font_family": "met_semi_bold",
        },
        {
          "text":
              "This is a sample text for the subtitle that you can add to contextual cards",
          "type": "generic_text",
          "color": "#ffffff",
          "font_size": 16,
          "font_style": "underline",
          "font_family": "met_regular",
        },
      ],
    },
    "positional_images": [],
    "components": [],
    "url": "https://google.com",
    "bg_image": {
      "image_type": "ext",
      "image_url":
          "https://hok.famapp.co.in/hok-assets/feedMedia/ext/70db327c-b5a0-4485-b97d-6b5eae1f1614-1734193722611.webp",
      "aspect_ratio": 0.9142857,
    },
    "cta": [
      {
        "text": "Action",
        "type": "normal",
        "bg_color": "#000000",
        "is_circular": false,
        "is_secondary": false,
        "stroke_width": 0,
      },
    ],
    "is_disabled": false,
    "is_shareable": false,
    "is_internal": false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FamAppBar(),
      body: ListView(children: [HC3Card(cardData: sampleCard)]),
    );
  }
}
