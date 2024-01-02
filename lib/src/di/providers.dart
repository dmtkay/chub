import 'dart:ui' as ui;

import 'package:church_hub_mobile/src/config/routes/app_router.dart';
import 'package:church_hub_mobile/src/utils/observers/locale_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

/// App Localized strings
@riverpod
AppLocalizations appStrings(AppStringsRef ref) {
  // 1. initialize from the initial locale
  ref.state = lookupAppLocalizations(ui.PlatformDispatcher.instance.locale);
  // 2. create an observer to update the state
  final observer = LocaleObserver((locales) {
    ref.state = lookupAppLocalizations(ui.PlatformDispatcher.instance.locale);
  });
  // 3. register the observer and dispose it when no longer needed
  final binding = WidgetsBinding.instance;
  binding.addObserver(observer);
  ref.onDispose(() => binding.removeObserver(observer));
  // 4. return the state
  return ref.state;
}

@riverpod
Raw<AppRouter> router(RouterRef ref) => AppRouter();
