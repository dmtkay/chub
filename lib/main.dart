import 'package:church_hub_mobile/src/app.dart';
import 'package:church_hub_mobile/src/utils/observers/state_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final container = ProviderContainer(
  observers: [
    StateObserver(),
  ],
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Set status bar color to white
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ),
  );
  // Disable landscape mode
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const App(),
    ),
  );
}
