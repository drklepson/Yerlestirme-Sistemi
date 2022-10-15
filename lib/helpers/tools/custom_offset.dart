import 'package:flutter/material.dart';

class CustomOffset extends Offset {
  CustomOffset(super.dx, super.dy);

  static final CustomOffset bottomLeft = CustomOffset(0, 1);
}
