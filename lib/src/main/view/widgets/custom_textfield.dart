///
import 'package:widgetbook_challenge/src/controller.dart';

import 'package:widgetbook_challenge/src/view.dart';

//import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Custom textfield widget
//class CustomTextField extends ConsumerWidget {
class CustomTextField extends StatefulWidget {
  /// Compile before runtime
  const CustomTextField({super.key});

  @override
  State createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends StateX<CustomTextField> {
  @override
  void initState() {
    super.initState();
    con = AppController();
    appColors = AppColors();

    /// A StateX has access to all the StateXControllers
    /// This will not return null, only because NameController()
    /// was added to the 'root' State object: _AppState in app.dart
    /// That's lazy! Not modular! Keep it localized using the Singleton pattern
    nameController = controllerByType<NameController>()!;

    /// Frankly, since all StateXControllers use factory constructors
    nameController = NameController();

    textEditingController = nameController.textEditingController;

    /// Don't repaint the 'whole screen'. Simply repaint this TextField!!
    textEditingController.addListener(() => setState(() =>
        nameController.isValidName = isAlpha(textEditingController.text)));
  }

  late AppController con;
  late AppColors appColors;
  late NameController nameController;
  late TextEditingController textEditingController;
  ThemeData? data;

  @override
//  Widget build(BuildContext context, WidgetRef ref) {
  Widget build(BuildContext context) {
    //
//    final currentThemeMode = ref.watch(themeModeProvider);
    // No need to retrieve the ThemeData with every build
    data ??= Theme.of(context).copyWith(
      colorScheme:
          ThemeData().colorScheme.copyWith(primary: appColors.kShadeColor),
    );
    return Theme(
      data: data!,
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: 'My name'.tr,
          hintStyle: const TextStyle(fontWeight: FontWeight.bold),
          prefixIcon: Icon(
            Icons.person,
            color: appColors.kShadeColor,
          ),
          suffix: nameController.isValidName
              ? Icon(
                  Icons.sentiment_very_satisfied,
                  color: appColors.kGreenIndicatorColor,
                )
              : Icon(
                  Icons.sentiment_dissatisfied,
                  color: appColors.kRedIndicatorColor,
                ),
          filled: true,
          fillColor: appColors.kShadeColor.withOpacity(0.1),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: con.currentThemeMode == ThemeMode.light
                  ? appColors.kShadeColor.withOpacity(0.1)
                  : appColors.kTextFieldFillColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
