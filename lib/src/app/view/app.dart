///
import 'package:widgetbook_challenge/src/controller.dart';

import 'package:widgetbook_challenge/src/model.dart';

import 'package:widgetbook_challenge/src/view.dart' hide App;

///
class App extends AppStatefulWidget {
  ///
  App({super.key});

  @override
  _AppState createAppState() => _AppState();
}

class _AppState extends AppState<App> {
  //
  _AppState()
      : super(
          controller: AppController(),
          controllers: [NameController()],
          debugShowCheckedModeBanner: false,
          title: 'Challenge App'.tr,
          theme: AppTheme().light,
          darkTheme: AppTheme().dark,
          inThemeMode: () => AppController().currentThemeMode,
          locale: L10n.locale,
          localizationsDelegates: [
            L10n.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          inSupportedLocales: () {
            /// The app's translations
            L10n.translations = {
              const Locale('zh', 'CN'): zhCN,
              const Locale('fr', 'FR'): frFR,
              const Locale('de', 'DE'): deDE,
              const Locale('he', 'IL'): heIL,
              const Locale('ru', 'RU'): ruRU,
              const Locale('es', 'AR'): esAR,
            };
            return L10n.supportedLocales;
          },
          home: const HomeView(),
        );
}
