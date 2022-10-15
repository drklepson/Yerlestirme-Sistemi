import 'package:flutter/material.dart';
import 'package:yerlestirme_update/helpers/extensions/context_extension.g.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({super.key, this.size = 30, this.text});
  final double size;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox.square(
          dimension: size,
          child: CircularProgressIndicator(color: context.primaryColor),
        ),
        if (text != null) SizedBox(width: size * 3, child: Text(text!)),
      ],
    );
  }
}
