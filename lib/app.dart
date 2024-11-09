import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:tezyetkazz/src/core/widgets/app_material_context.dart";
import "package:tezyetkazz/src/core/widgets/custom_screen_util.dart";

class App extends StatelessWidget {
  const App({super.key});

  static void run() async {
    await EasyLocalization.ensureInitialized();

    // await configureDependencies();

    runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('uz', 'UZ'),
          Locale('ru', 'RU'),
        ],
        path: 'assets/locales',
        fallbackLocale: const Locale('uz', 'UZ'),
        startLocale: const Locale('uz', 'UZ'),
        child: const ProviderScope(
          child: App(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => const CustomScreenUtil(
        enabledPreview: false,
        child: AppMaterialContext(),
      );
}
