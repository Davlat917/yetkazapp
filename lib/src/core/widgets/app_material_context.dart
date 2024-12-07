import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:tezyetkazz/src/feature/splash/splash_page.dart";
import "../../feature/settings/inherited_locale_notifier.dart";
import "../../feature/settings/inherited_theme_notifier.dart";
import "../../feature/settings/locale_controller.dart";
import "../../feature/settings/theme_controller.dart";

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
              theme: ThemeData(
                bottomSheetTheme: BottomSheetThemeData(
                  backgroundColor: Colors.white,
                ),
              ),
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              // theme: InheritedThemeNotifier.maybeOf(context)?.theme,
              home: SplashPage(),
            ),
          ),
        ),
      );
}
