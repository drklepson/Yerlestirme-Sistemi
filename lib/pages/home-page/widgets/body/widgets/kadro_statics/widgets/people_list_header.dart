import 'package:flutter/material.dart';

class PeopleListHeaders extends StatelessWidget {
  const PeopleListHeaders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Text(
        'Sıra',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1),
      ),
      minLeadingWidth: 8,
      title: Text(
        'İsim Soyisim',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1),
      ),
      trailing: Text(
        'Puan',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1),
      ),
    );
  }
}
