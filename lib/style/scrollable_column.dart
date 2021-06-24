import 'package:flutter/material.dart';

class ScrollableColumn extends StatelessWidget {
  final Column child;
  final EdgeInsets? padding;

  const ScrollableColumn({this.padding, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
          child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: viewportConstraints.maxHeight,
        ),
        child: IntrinsicHeight(
          child: padding == null
              ? child
              : Padding(padding: padding!, child: child),
        ),
      ));
    });
  }
}
