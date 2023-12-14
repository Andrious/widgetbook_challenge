////
import 'package:fluttery_framework/controller.dart';

///
class NameController extends StateXController {
  /// Only ever need a single instance of this class
  factory NameController() => _this ??= NameController._();
  NameController._() {
    textEditingController = TextEditingController();
  }
  static NameController? _this;

  /// Composition and not Inheritance is implemented here
  late final TextEditingController textEditingController;

  ///
  bool isValidName = false;

  ///
  void onPressed() {
    loading = true;
    state?.setState(() {});
  }

  /// Determine if a 'loading' procedure is to occur
  bool loading = false;

  ///
  String? result;

  /// Link a widget (via. context) to a InheritedWidget
  @override
  bool dependOnInheritedWidget(BuildContext? context) =>
      super.dependOnInheritedWidget(
          context); // Place a breakpoint here to see how this works.

  @override
  void dispose() {
    // Don't forget to clean up memory
    textEditingController.dispose();
    super.dispose();
  }
}
