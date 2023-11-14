import 'package:drklepson_utility_package/tools/dialog_manager.dart';
import 'package:flutter/material.dart';
import 'package:yerlestirme_update/models/kadro.dart';
import 'package:yerlestirme_update/pages/home-page/home_model.dart';

class TercihReorderItem extends StatelessWidget {
  const TercihReorderItem({
    required this.indexValue,
    required this.model,
    required this.index,
    required this.first,
    required this.last,
    super.key,
  });

  final KadroModel indexValue;
  final int index;
  final HomePageModel model;
  final bool first;
  final bool last;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('${index + 1}'),
      title: ListTile(
        title: Text(
          indexValue.kurum,
          maxLines: 2,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!last)
              InkWell(
                onTap: () => DialogManager.futureLoading(
                  model.tercihReorder(index, index + 2),
                ),
                child: const Icon(Icons.arrow_downward),
              ),
            if (!first)
              InkWell(
                onTap: () => DialogManager.futureLoading(
                  model.tercihReorder(index, index - 1),
                ),
                child: const Icon(Icons.arrow_upward),
              ),
            InkWell(
              onTap: () =>
                  DialogManager.futureLoading(model.tercihSilme(index)),
              child: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
      minLeadingWidth: 8,
      // ,
    );
  }
}
