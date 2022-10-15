import 'package:flutter/cupertino.dart';

extension WidgetExtension on Widget {
  Widget get paddingTopSmall => Padding(
        padding: const EdgeInsets.only(top: 8),
        child: this,
      );

  Widget get paddingTopNormal => Padding(
        padding: const EdgeInsets.only(top: 12),
        child: this,
      );

  Widget get paddingTopBig => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: this,
      );

  Widget get paddingAll => Padding(
        padding: const EdgeInsets.all(16),
        child: this,
      );

  Widget sized(double size) => SizedBox(
        width: size,
        height: size,
        child: this,
      );
}

extension WidgetListPadding on List<Widget> {
  List<Widget> itemPadding(EdgeInsets insets) => map(
        (e) => Padding(
          padding: insets,
          child: e,
        ),
      ).toList();
}
