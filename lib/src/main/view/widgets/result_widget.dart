///
import 'package:widgetbook_challenge/src/controller.dart';

/// custom async value result widget
class ResultWidget extends StatelessWidget {
  /// create a new instance of [ResultWidget]
  const ResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final con = NameController();
    // Since ResultWidget is const, it won't get rebuilt unless told to.
    con.dependOnInheritedWidget(context);
    Widget widget;
    if (con.result == null) {
      widget = const SizedBox.shrink();
    } else {
      widget = Center(child: Text(con.result!));
    }

    return widget;
  }
}
