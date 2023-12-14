///
import 'package:widgetbook_challenge/src/controller.dart';
import 'package:widgetbook_challenge/src/model.dart';
import 'package:widgetbook_challenge/src/view.dart';

//import 'package:flutter_riverpod/flutter_riverpod.dart';

/// a custom [SubmitButton] to connect to logic controller
class SubmitButton extends StatelessWidget {
  /// Supply the user input to this button
  const SubmitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    NameController().dependOnInheritedWidget(context);
    return ElevatedButton(
      onPressed: NameController().onPressed,
      child: Center(child: SubmitCaption(text: 'Submit'.tr)),
    );
  }
}

///
class SubmitCaption extends StatefulWidget {
  ///
  const SubmitCaption({
    super.key,
    required this.text,
  });

  /// Button's caption
  final String text;

  @override
  State createState() => _SubmitState();
}

/// Use StateX to take advantage of its initAsync() function.
/// iniState() is for synchronous operations.
/// initAsync() is for asynchronous operations.
class _SubmitState extends StateX<SubmitCaption> {
  @override
  void initState() {
    super.initState();

    /// A StateX also has access to all the StateXControllers
    /// Particularly those taken in by the 'root' State object, _AppState,
    con = controllerByType<NameController>()!;

    /// Frankly, since all StateXControllers use factory constructors simply instantiate.
    con = NameController();

    widgetbookApi = WidgetbookApi();
  }

  late NameController con;
  late WidgetbookApi widgetbookApi;

  /// With its built-in FutureBuilder, this State object
  /// can perform any asynchronous operations before displaying on screen
  /// Meanwhile a CircularProgressIndicator() will automatically appear.
  /// Brilliant!
  @override
  Future<bool> initAsync() async {
    await super.initAsync();
    //
    if (con.loading) {
      //
      con.loading = false;
      try {
        //
        con.result = await widgetbookApi.welcomeToWidgetbook(
            message: con.textEditingController.text);
      } catch (e) {
        //
        final errorDetails = FlutterErrorDetails(
          exception: e,
          stack: e is Error ? e.stackTrace : null,
          library: 'submit_button.dart',
          context:
              ErrorDescription('Error by widgetbookApi.welcomeToWidgetbook()'),
        );
        // Resets the count of errors to show a complete error message not an abbreviated one.
        FlutterError.resetErrorCount();
        // Log errors
        FlutterError.presentError(errorDetails);

        /// More modular and concise to place the showSnackBar here
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('widgetbookApi Error\n\rPlease try again.'),
            backgroundColor: AppColors().kRedIndicatorColor,
          ),
        );
      }
      //
      con.state?.setState(() {});
    }
    return true;
  }

  @override
  Widget builder(context) => Text(widget.text);

  /// Allow initAsync() to run repeatedly.
  @override
  Future<bool> runAsync() => initAsync();
}
