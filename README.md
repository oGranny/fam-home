# fam_home

A new Flutter project.

- Not sure what components[] and positional_images[] are for in BaseCard.
- height is too big, 600 covers almost entire screen, scaled it down.
- if height is given to widget with image, it would change the aspect ratio or wont show the complete image (as in case of HC3), if image is present and full width is there keeping the height of card equal to the height of child image.
    - HC3: Did not consider height in HC3, took image height for preserving aspect ratio
    - HC6: scaled height by factor of 3, scaled icon in it by a factor of 2.5.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
