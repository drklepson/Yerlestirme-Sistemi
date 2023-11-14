import 'package:drklepson_utility_package/drklepson_utility_package.dart';
import 'package:flutter/material.dart';
import 'package:yerlestirme_update/const/iller.dart';

class SehirFormField extends StatelessWidget {
  const SehirFormField({required this.controller, super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return GenericAutoCompDrop<String>(
      labelText: 'Şehir',
      itemView: Text.new,
      items: iller.values.map((e) => e['name']!),
      toStringMethod: (item) => item,
      onSelected: (item) {
        controller.value = TextEditingValue(text: item);
      },
      listWidth: context.width < 450 ? context.width - 50 : 400,
    );
  }
}
