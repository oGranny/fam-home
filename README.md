# Fam Home

<p align="center">
  <img src="assets/logo_with_text.png" alt="Fam Home" width="320" />
</p>

A Flutter demo app that renders a feed of heterogeneous cards from JSON and supports interactions like swipe/hidden actions, open URLs, and persistence of dismissed items.

## Downloads
- Prebuilt Android APKs are available in the GitHub Releases section: https://github.com/oGranny/fam-home/releases
- The CI workflow uploads `app-release.apk` on tagged builds (v*) and on pushes to `master`.

## App entry

- App entry and theme:
  - [`main.dart`](lib/main.dart)
  - [`themedata`](lib/utils/themedata.dart)

- Primary page:
  - [`HomePage`](lib/pages/home_page.dart)
    - Fetches data via [`DataService.fetchData`](lib/services/data_service.dart) using [`apiUrl`](lib/utils/constants.dart)
    - Builds an `AnimatedList` of card sections in design-level order
    - Skips HC3 card sections whose card IDs are stored in SharedPreferences under key `dismissed_cards`
    - Pull-to-refresh clears and reloads with animation

For local/dummy data, see [`dummy_home_page.dart`](lib/pages/dummy_home_page.dart) which composes the same widgets with inline JSON.

## Card containers

Each design type maps to a container widget that lays out a section:

- [`HC3Container`](lib/widgets/cards/big_display_card.dart) – Big display card with hidden actions
- [`HC5Container`](lib/widgets/cards/image_card.dart) – Image card, scrollable/non-scrollable
- [`HC6Container`](lib/widgets/cards/small_card_with_arrow.dart) – Small card with arrow
- [`HC1Container`](lib/widgets/cards/small_display_card.dart) – Small display card with title/description
- [`HC9Container`](lib/widgets/cards/dynamic_width_scrollable_card.dart) – Gradient image strip

Supporting UI:
- [`ActionButton`](lib/widgets/action_button.dart) – CTA button
- [`HiddenButton`](lib/widgets/hidden_button.dart) – Hidden quick actions used in HC3
- [`FamRichText`](lib/widgets/fam_rich_text.dart) – Renders formatted text entities

## Interactions

- Open URL on tap
- HC3 Hidden actions (long-press to reveal):
  - Long-press the big card area to slide and reveal hidden buttons
  - "dismiss now" stores card ID in SharedPreferences (`dismissed_cards`) and removes the HC3 section
  - "remind later" removes the current HC3 section instance without persisting

- Pull to refresh:
  - On [`HomePage`](lib/pages/home_page.dart), pull down to reload from API and animate new insertions

## Developer shortcuts 

- reset dismissed HC3 cards
    - Long-press any HC5 image card to reset the SharedPreferences key used for HC3 dismissals.
- change API URL
    - Edit the `apiUrl` constant in `lib/utils/constants.dart` to change the data source.

## Notes and assumptions:

- Heights are scaled to fit designs and preserve images:
  - HC3: Uses image aspect ratio for height (ignores provided height to avoid cropping)
  - HC6: Scales height by 3; icon scaled by 2.5
  - HC9: Scales height by 1.2

## Animation and persistence

- The page uses `AnimatedList` for remove transitions
- HC3 dismiss persistence:
  - Dismiss action writes the card ID to `dismissed_cards` in `SharedPreferences`
  - On load, [`HomePage`](lib/pages/home_page.dart) filters out HC3 sections containing any dismissed card ID

## Packages

- url_launcher – open external links
- shared_preferences – persist dismissed HC3 card IDs

## Run

- Flutter 3.x recommended
- Install dependencies:
  - `flutter pub get`
- Run:
  - `flutter run`

