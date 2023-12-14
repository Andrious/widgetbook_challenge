///

//import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:widgetbook_challenge/src/controller.dart';
import 'package:widgetbook_challenge/src/view.dart';

/// main home page view
class HomeView extends StatefulWidget {
  /// Creates a new instance of [HomeView].
  const HomeView({Key? key}) : super(key: key);

  @override
  State createState() => _HomeViewState();
}

/// The StateX class allows for a clean architecture
/// with separate controllers concerned with the logic at the State object level!
class _HomeViewState extends StateX<HomeView> {
  _HomeViewState()
      : super(controller: NameController()); // NameController works the logic!
  late final NameController nameController;

  @override
  void initState() {
    super.initState();

    // The App as a whole has its own controller called, AppController
    /// You've a few ways to get the app's own controller
    appCon = startState!.controller as AppController;
    appCon = controllerByType<AppController>()!;
    // Since I prefer all controllers use factory constructors, simply instantiate it here
    appCon = AppController();
  }

  late AppController appCon;

  @override
  Widget build(BuildContext context) {
    // final result = ref.watch(messageButtonControllerProvider);
    // final currentThemeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Interview Challenge'.tr),
        actions: [
          PopupMenuButton<void>(
            icon: const Icon(Icons.translate),
            itemBuilder: (context) => L10n.supportedLocales
                .map(
                  (e) => PopupMenuItem(
                    value: e,
                    child: Text(e.languageCode),
                    onTap: () {
                      L10n.locale = e;
                      appCon.setState(() {});
                    },
                  ),
                )
                .toList(),
          ),
          IconButton(
            // The 'app' controller is actually called to perform the toggle but the interface need not know
            onPressed: appCon.toggleThemeMode,
            icon: appCon.currentThemeMode == ThemeMode.dark
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Flutter enthusiast!'.tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(fontSize: 27),
            ),
            const SizedBox(height: 40),
            Text(
              "Tell me - what's your name?".tr,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.all(8),
              child: CustomTextField(),
            ),

            /// Like the original WidgetBook version,
            /// pressing the Submit button will call this build() repeatedly
            /// However, place const in front of SubmitButton() and ResultWidget(),
            /// this will then no longer work.
            /// This all works, but we can do better.

            const SizedBox(height: 30),
            SubmitButton(), // Note, no const so to work properly but inefficiently
            const SizedBox(height: 30),
            ResultWidget(), // Note, no const so to work properly but inefficiently
          ], // Unfortunately, the whole screen is repainted with every button press.
        ),
      ),
    );
  }
}

/// Comment the State class above and try this one below.
/// It is much more efficient will with many the widgets prefixed with const.
/// However, that means an InheritedWidget will have to be used when pressing Submit.

// class _HomeViewState extends StateIn<HomeView> {
//   _HomeViewState() : super(controller: NameController());
//   late final NameController nameController;
//
//   @override
//   void initState() {
//     super.initState();
//
//     /// You've a few ways to get the app's own controller
//     _appCon = startState!.controller as AppController;
//     _appCon = controllerByType<AppController>()!;
//     // Since I prefer all controllers use factory constructors, simply instantiate it here
//     _appCon = AppController();
//   }
//
//   late AppController _appCon;
//
//   @override
//   Widget buildIn(BuildContext context) {
//     // final result = ref.watch(messageButtonControllerProvider);
//     // final currentThemeMode = ref.watch(themeModeProvider);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Interview Challenge'.tr),
//         actions: [
//           PopupMenuButton<void>(
//             icon: const Icon(Icons.translate),
//             itemBuilder: (context) => L10n.supportedLocales
//                 .map(
//                   (e) => PopupMenuItem(
//                     value: e,
//                     child: Text(e.languageCode),
//                     onTap: () {
//                       L10n.locale = e;
//                       _appCon.setState(() {});
//                     },
//                   ),
//                 )
//                 .toList(),
//           ),
//           IconButton(
//             // The 'app' controller is actually called to perform the toggle but the interface need not know
//             onPressed: _appCon.toggleThemeMode,
//             icon: _appCon.currentThemeMode == ThemeMode.dark
//                 ? const Icon(Icons.light_mode)
//                 : const Icon(Icons.dark_mode),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Hello Flutter enthusiast!'.tr,
//               style: Theme.of(context)
//                   .textTheme
//                   .displayLarge
//                   ?.copyWith(fontSize: 27),
//             ),
//             const SizedBox(height: 40),
//             Text(
//               "Tell me - what's your name?".tr,
//               style: Theme.of(context)
//                   .textTheme
//                   .bodyLarge
//                   ?.copyWith(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 50),
//             const Padding(
//               padding: EdgeInsets.all(8),
//               child: CustomTextField(),
//             ),
//             const SizedBox(height: 30),
//             const SubmitButton(),
//             const SizedBox(height: 30),
//             const ResultWidget(),
//           ],
//         ),
//       ),
//     );
//   }
// }
