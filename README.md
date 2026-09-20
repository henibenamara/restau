# Restau

An early Flutter app for managing a catalogue of articles and categories, built in 2023 while I was learning Flutter. It is the mobile client for [restau-backend](https://github.com/henibenamara/restau-backend).

## What it does

- Onboarding screens and a login screen
- Browse articles and categories, and filter articles by category
- View an article's details
- Add and edit articles, including picking an image from the gallery
- Add categories

## Stack

Flutter and Dart with the `http` package for the REST calls, plus `introduction_screen`, `image_picker` and `email_validator`.

## Project layout

```text
lib/
├── views/       screens (home, articles, categories, login, onboarding)
├── models/      article and response models
├── service/     REST calls (articleservice)
├── widgets/     shared widgets (drawer, buttons, background)
└── constant/    API settings
```

## Status

This is an early project and I no longer maintain it. It targets Dart 2.x (the SDK constraint in `pubspec.yaml` is below 3.0), so it needs an older Flutter SDK to run, and the API address is hard-coded in `lib/service/article_service.dart` and `lib/constant/app_constant.dart`.

For my current approach to structuring Flutter apps, see [flutter-clean-architecture](https://github.com/henibenamara/flutter-clean-architecture).
