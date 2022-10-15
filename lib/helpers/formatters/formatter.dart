import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:turkish/turkish.dart';

class CustomFormatters {
  static String get _phoneMask => '0 (5##) ### ## ##';
  static String get _dateMask => 'G#.M#.20Y#';
  static String get _aPuaniMask => 'P#.##';
  static String _codeMask(int length) => '#${'-#' * length}';

  static MaskTextInputFormatter get aPuani => MaskTextInputFormatter(
        mask: _aPuaniMask,
        type: MaskAutoCompletionType.eager,
        initialText: '45.00',
        filter: {
          'P': RegExp('[1-8]'),
          '#': RegExp('[0-9]'),
        },
      );

  static MaskTextInputFormatter get phone => MaskTextInputFormatter(
        mask: _phoneMask,
        type: MaskAutoCompletionType.eager,
        filter: {'#': RegExp('[0-9]')},
      );

  static MaskTextInputFormatter get time => MaskTextInputFormatter(
        mask: _dateMask,
        type: MaskAutoCompletionType.eager,
        filter: {
          '#': RegExp('[0-9]'),
          'G': RegExp('[0-3]'),
          'M': RegExp('[0-1]'),
          'Y': RegExp('[0-2]'),
        },
      );

  static MaskTextInputFormatter code(int length) => MaskTextInputFormatter(
        mask: _codeMask(length - 1),
        type: MaskAutoCompletionType.eager,
        filter: {'#': RegExp('[0-9]')},
      );

  static TextInputFormatter get uppercase => TextInputFormatter.withFunction(
        (oldValue, newValue) =>
            newValue.copyWith(text: turkish.toUpperCase(newValue.text)),
      );
}
