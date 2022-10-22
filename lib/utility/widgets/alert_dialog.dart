import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:yerlestirme_update/helpers/extensions/extension.dart';

const borderRadius = BorderRadius.vertical(top: Radius.circular(20));
const edgeInsets = EdgeInsets.symmetric(vertical: 12, horizontal: 16);

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.titleText,
    this.content,
    this.actions,
  });

  final String titleText;
  final Widget? content;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: edgeInsets,
      actionsPadding: edgeInsets,
      title: SizedBox(
        width: math.min(context.width * 0.8, 360),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: edgeInsets,
                decoration: BoxDecoration(
                  color: context.primaryColor,
                  borderRadius: borderRadius,
                ),
                child: Center(
                  child: Text(
                    titleText,
                    style: context.textTheme.titleLarge?.copyWith(
                      color: context.colorScheme.background,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      content: SingleChildScrollView(child: content),
      actions: actions,
    );
  }
}
