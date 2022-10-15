import 'package:flutter/material.dart';
import 'package:yerlestirme_update/models/user.dart';

class PeopleListItem extends StatelessWidget {
  const PeopleListItem({super.key, required this.user, required this.index});

  final UserModel user;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Text(
        '$index', //'${kazanSira + 1}',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1),
      ),
      minLeadingWidth: 8,
      title: Text(
        user.name,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1),
      ),
      trailing: Text(
        user.puan.toString(),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1),
      ),
    );
  }
}
