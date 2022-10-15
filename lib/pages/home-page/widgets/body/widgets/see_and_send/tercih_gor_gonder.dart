import 'package:flutter/material.dart';
import 'package:yerlestirme_update/controllers/auth_controller.dart';
import 'package:yerlestirme_update/helpers/extensions/context_extension.g.dart';
import 'package:yerlestirme_update/models/kadro.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/tercih_list_model.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/widgets/see_and_send/widgets/tercih_reorder_item.dart';

class TercihGorGonder extends StatefulWidget {
  const TercihGorGonder({super.key, required this.model});

  final TercihListModel model;

  @override
  State<TercihGorGonder> createState() => _TercihGorGonderState();
}

class _TercihGorGonderState extends State<TercihGorGonder>
    with AutomaticKeepAliveClientMixin {
  late TercihListModel model;

  @override
  void initState() {
    model = widget.model;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Card(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ValueListenableBuilder<AuthController>(
              valueListenable: AuthController(),
              builder: (context, value, child) {
                final kadroList = value.firstKadroList ?? <KadroModel>[];

                return ValueListenableBuilder<List<String?>>(
                  valueListenable: model,
                  builder: (context, value, child) =>
                      ReorderableListView.builder(
                    key: GlobalKey(),
                    shrinkWrap: true,
                    itemCount: value.length,
                    buildDefaultDragHandles: false,
                    itemBuilder: (context, index) {
                      final kadro = kadroList.firstWhere(
                        (e) => e.kadroId == value.elementAt(index),
                      );
                      return TercihReorderItem(
                        key: ValueKey(kadro),
                        indexValue: kadro,
                        model: model,
                        index: index,
                        first: index == 0,
                        last: index == (value.length - 1),
                      );
                    },
                    onReorder: (oldIndex, newIndex) => context
                        .loading(model.tercihReorder(oldIndex, newIndex)),
                  ),
                );
              },
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Güncelle')),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
