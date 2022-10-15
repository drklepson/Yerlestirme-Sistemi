import 'package:flutter/material.dart';
import 'package:yerlestirme_update/const/iller.dart';
import 'package:yerlestirme_update/helpers/extensions/extension.dart';
import 'package:yerlestirme_update/utility/widgets/generic_drop.dart';

class SehirFormField extends StatelessWidget {
  const SehirFormField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return GenericAutoCompDrop<String>(
      labelText: 'Şehir',
      itemView: Text.new,
      items: illerListesi.values.toList(),
      toStringMethod: (item) => item,
      onSelected: (item) {
        controller.value = TextEditingValue(text: item);
      },
      listWidth: context.width < 450 ? context.width - 50 : 400,
    );
  }
}
