import 'package:fam_home/entities/base_card.dart';
import 'package:fam_home/entities/card_group.dart';
import 'package:fam_home/widgets/cards/big_display_card.dart';
import 'package:fam_home/widgets/cards/dynamic_width_scrollable_card.dart';
import 'package:fam_home/widgets/cards/small_display_card.dart';
import 'package:fam_home/widgets/fam_app_bar.dart';
import 'package:fam_home/widgets/cards/image_card.dart';
import 'package:fam_home/widgets/cards/small_card_with_arrow.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BaseCard sampleCard = BaseCard.fromJson({
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

  final CardEntity hc6Card = CardEntity.fromJson({
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

  final CardEntity hc3entity = CardEntity.fromJson({
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

  final CardEntity hc5entity = CardEntity.fromJson({
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

  final CardEntity hc9entity = CardEntity.fromJson({
    "id": 79,
    "name": "hc9GradientHCG",
    "design_type": "HC9",
    "card_type": 1,
    "cards": [
      {
        "id": 5,
        "name": "yellowGradient",
        "slug": "yellow_gradient",
        "positional_images": [],
        "components": [],
        "bg_image": {
          "image_type": "ext",
          "image_url":
              "https://hok.famapp.co.in/hok-assets/feedMedia/ext/6519c154-0d95-418a-941e-95244edd171c-1734194242075.webp",
          "aspect_ratio": 0.3282,
        },
        "bg_gradient": {
          "angle": 336,
          "colors": ["#FBAF03", "#FFD428"],
        },
        "is_disabled": false,
        "is_shareable": false,
        "is_internal": false,
      },
      {
        "id": 6,
        "name": "dayLightGradient",
        "slug": "dayLightGradient",
        "positional_images": [],
        "components": [],
        "bg_image": {
          "image_type": "ext",
          "image_url":
              "https://hok.famapp.co.in/hok-assets/feedMedia/ext/f4153522-cad5-4248-a787-788aee5f7811-1734194287612.webp",
          "aspect_ratio": 0.5487,
        },
        "bg_gradient": {
          "angle": 336,
          "colors": ["#FF8749", "#454AA6"],
        },
        "is_disabled": false,
        "is_shareable": false,
        "is_internal": false,
      },
      {
        "id": 7,
        "name": "greenGradient",
        "slug": "green-gradient",
        "positional_images": [],
        "components": [],
        "bg_image": {
          "image_type": "ext",
          "image_url":
              "https://hok.famapp.co.in/hok-assets/feedMedia/ext/e4daab01-63dc-49fe-8154-33b17815dad3-1734194359153.webp",
          "aspect_ratio": 1,
        },
        "bg_gradient": {
          "angle": 336,
          "colors": ["#000000", "#28FFA5"],
        },
        "is_disabled": false,
        "is_shareable": false,
        "is_internal": false,
      },
    ],
    "is_scrollable": false,
    "height": 195,
    "is_full_width": false,
    "slug": "hc9GradientHCG",
    "level": 3,
  });

  final CardEntity hc1entity = CardEntity.fromJson({
    "id": 80,
    "name": "DisplayCards",
    "design_type": "HC1",
    "card_type": 1,
    "cards": [
      {
        "id": 9,
        "name": "aStark",
        "slug": "aStark",
        "title": " ",
        "formatted_title": {
          "text": " ",
          "align": "left",
          "entities": [
            {
              "text": "Small display card",
              "type": "generic_text",
              "color": "#000000",
              "font_style": "underline",
              "font_family": "met_semi_bold",
            },
          ],
        },
        "description": " ",
        "formatted_description": {
          "text": " ",
          "align": "left",
          "entities": [
            {
              "text": "Arya Stark",
              "type": "generic_text",
              "color": "#000000",
              "font_style": "underline",
              "font_family": "met_regular",
            },
          ],
        },
        "icon": {
          "image_type": "ext",
          "image_url":
              "https://hok.famapp.co.in/hok-assets/feedMedia/ext/b4827462-93a9-4963-98b9-255942f10530-1734193289680.webp",
          "aspect_ratio": 1,
        },
        "positional_images": [],
        "components": [],
        "bg_color": "#FBAF03",
        "is_disabled": false,
        "is_shareable": false,
        "is_internal": false,
      },
      {
        "id": 3,
        "name": "smallCardWithArrow",
        "slug": "smallCardWithArrow",
        "title": " ",
        "formatted_title": {
          "text": " ",
          "align": "left",
          "entities": [
            {
              "text": "Small card with an arrow ",
              "type": "generic_text",
              "color": "#000000",
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
    "is_scrollable": true,
    "height": 64,
    "is_full_width": false,
    "level": 4,
  });

  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  late List<Widget> _cards;
  @override
  void initState() {
    super.initState();
    _cards = [
      HC3Container(
        cardGroup: hc3entity,
        onDismiss: () => _removeHC3Section(hc3entity.id),
      ),
      HC6Container(cardGroup: hc6Card),
      HC5Container(cardGroup: hc5entity),
      HC9Container(cardGroup: hc9entity),
      HC1Container(cardGroup: hc1entity),
    ];
  }

  void _removeHC3Section(int id) {
    final index = _cards.indexWhere((w) => w is HC3Container && w.id == id);
    if (index != -1) {
      final removedItem = _cards.removeAt(index);
      _listKey.currentState?.removeItem(
        index,
        (context, animation) =>
            SizeTransition(sizeFactor: animation, child: removedItem),
        duration: const Duration(milliseconds: 300),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FamAppBar(),
      backgroundColor: const Color(0xFFF7F6F3),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _cards.length,
        itemBuilder: (context, index, animation) {
          return SizeTransition(sizeFactor: animation, child: _cards[index]);
        },
      ),
    );
  }
}
