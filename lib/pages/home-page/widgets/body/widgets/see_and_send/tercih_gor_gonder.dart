import 'package:drklepson_utility_package/tools/dialog_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yerlestirme_update/controllers/auth_controller.dart';
import 'package:yerlestirme_update/models/kadro.dart';
import 'package:yerlestirme_update/pages/home-page/home_model.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/widgets/see_and_send/widgets/tercih_reorder_item.dart';

class TercihGorGonder extends StatefulWidget {
  const TercihGorGonder({super.key});

  @override
  State<TercihGorGonder> createState() => _TercihGorGonderState();
}

class _TercihGorGonderState extends State<TercihGorGonder>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Card(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Consumer<AuthController>(
          builder: (context, value, child) {
            final kadroList = value.firstKadroList ?? <KadroModel>[];

            return Consumer<HomePageModel>(
              builder: (context, model, child) => ReorderableListView.builder(
                key: GlobalKey(),
                shrinkWrap: true,
                itemCount: model.tercihValueList.length,
                buildDefaultDragHandles: false,
                itemBuilder: (context, index) {
                  final kadro = kadroList.firstWhere(
                    (e) => e.kadroId == model.tercihValueList[index],
                  );
                  return TercihReorderItem(
                    key: ValueKey(kadro),
                    indexValue: kadro,
                    model: model,
                    index: index,
                    first: index == 0,
                    last: index == (model.tercihValueList.length - 1),
                  );
                },
                onReorder: (oldIndex, newIndex) => DialogManager.futureLoading(
                  model.tercihReorder(oldIndex, newIndex),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
