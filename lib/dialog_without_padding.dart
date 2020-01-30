import 'package:flutter/material.dart';

class DialogInsetDefeat extends StatelessWidget {
  final BuildContext context;
  final Widget child;
  final deInset = EdgeInsets.symmetric(horizontal: -40, vertical: -24);
  final EdgeInsets edgeInsets;

  DialogInsetDefeat(
      {@required this.context, @required this.child, this.edgeInsets});

  @override
  Widget build(BuildContext context) {
    var netEdgeInsets = deInset + (edgeInsets ?? EdgeInsets.zero);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(viewInsets: netEdgeInsets),
      child: child,
    );
  }
}

Future<T> showDialogWithInsets<T>({
  @required BuildContext context,
  bool barrierDismissible = true,
  @required WidgetBuilder builder,
  EdgeInsets edgeInsets,
}) {
  return showDialog(
    context: context,
    builder: (_) => DialogInsetDefeat(
      context: context,
      edgeInsets: edgeInsets,
      child: Builder(builder: builder),
    ),
    barrierDismissible: barrierDismissible = true,
  );
}
