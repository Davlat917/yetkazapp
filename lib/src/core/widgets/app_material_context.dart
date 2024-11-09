import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:tezyetkazz/app.dart";
import "package:tezyetkazz/src/core/widgets/button_navigation_bar.dart";
import "package:tezyetkazz/src/feature/home/view/pages/home_successfully_page.dart";
import "package:tezyetkazz/src/feature/profile/view/pages/profile_page1.dart";
import "../../feature/settings/inherited_locale_notifier.dart";
import "../../feature/settings/inherited_theme_notifier.dart";
import "../../feature/settings/locale_controller.dart";
import "../../feature/settings/theme_controller.dart";
import "../../feature/splash/splash_page.dart";

final ThemeController themeController = ThemeController();
final LocalController localController = LocalController();

class AppMaterialContext extends StatelessWidget {
  const AppMaterialContext({super.key});

  @override
  Widget build(BuildContext context) => InheritedThemeNotifier(
        themeController: themeController,
        child: InheritedLocalNotifier(
          localController: localController,
          child: Builder(
            builder: (context) => MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              // theme: InheritedThemeNotifier.maybeOf(context)?.theme,
              home: const SplashPage(),
            ),
          ),
        ),
      );
}
