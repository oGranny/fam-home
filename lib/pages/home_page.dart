import 'package:fam_home/entities/base_card.dart';
import 'package:fam_home/entities/card_group.dart';
import 'package:fam_home/widgets/action_button.dart';
import 'package:fam_home/widgets/cards/big_display_card.dart';
import 'package:fam_home/widgets/fam_app_bar.dart';
import 'package:fam_home/widgets/fam_rich_text.dart';
import 'package:fam_home/widgets/cards/image_card.dart';
import 'package:fam_home/widgets/cards/small_card_with_arrow.dart';
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

  CardEntity hc6Card = CardEntity.fromJson({
    "id": 77,
    "name": "hc6Small",
    "design_type": "HC6",
    "card_type": 1,
    "cards": [
      {
        "id": 3,
        "name": "smallCardWithArrow",
        "slug": "smallCardWithArrow",
        "title": "Hello World",
        "formatted_title": {
          "text": " ",
          "align": "left",
          "entities": [
            {
              "text": "Small card with arrow ",
              "type": "generic_text",
              "color": "#000000",
              // "font_size": 17,
              "font_style": "underline",
              "font_family": "met_semi_bold",
            },
          ],
        },
        "icon": {
          "image_type": "ext",
          "image_url":
              "https://hok.famapp.co.in/hok-assets/feedMedia/ext/5435b4ee-a962-4531-95d5-889e4038eece-1734193661283.webp",
          "aspect_ratio": 1,
        },
        "positional_images": [],
        "components": [],
        "url": "https://google.com",
        "bg_color": "#FBAF03",
        "icon_size": 16,
        "is_disabled": false,
        "is_shareable": false,
        "is_internal": false,
      },
    ],
    "is_scrollable": false,
    "height": 32,
    "is_full_width": true,
    "level": 1,
  });

  CardEntity hc3entity = CardEntity.fromJson({
    "id": 76,
    "name": "cardwithaction",
    "design_type": "HC3",
    "card_type": 1,
    "cards": [
      {
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
      },
    ],
    "is_scrollable": false,
    "height": 600,
    "is_full_width": false,
    "slug": "Cardwithaction",
    "level": 0,
  });

  CardEntity hc5entity = CardEntity.fromJson({
    "id": 78,
    "name": "hc5Images",
    "design_type": "HC5",
    "card_type": 1,
    "cards": [
      {
        "id": 4,
        "name": "stsMonkey",
        "slug": "stsMonkey",
        "title": "\n",
        "formatted_title": {
          "text": "{}\n",
          "align": "center",
          "entities": [
            {
              "type": "generic_text",
              "font_style": "underline",
              "font_family": "met_regular",
            },
          ],
        },
        "positional_images": [],
        "components": [],
        "bg_image": {
          "image_type": "ext",
          "image_url":
              "https://hok.famapp.co.in/hok-assets/feedMedia/ext/055c4856-53fc-41a1-8a30-354abfaa270c-1734193759460.webp",
          "aspect_ratio": 2.406015,
        },
        "is_disabled": false,
        "is_shareable": false,
        "is_internal": false,
      },
    ],
    "is_scrollable": false,
    "is_full_width": true,
    "slug": "hc5Images",
    "level": 2,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FamAppBar(),
      backgroundColor: const Color(0xFFF7F6F3),
      body: ListView(
        children: [
          HC3Container(cardGroup: hc3entity),
          HC6Container(cardGroup: hc6Card),
          HC5Container(cardGroup: hc5entity),
        ],
      ),
    );
  }
}
