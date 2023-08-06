import 'package:flutter/material.dart';
import 'package:yerlestirme_update/helpers/extensions/context_extension.g.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/tercih_list_model.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/widgets/chose_add/tercih_sec_ekle.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/widgets/kadro_statics/kadrolist_widget.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/widgets/see_and_send/tercih_gor_gonder.dart';

class HomeMobileLayout extends StatefulWidget {
  const HomeMobileLayout({required this.model, super.key});

  final TercihListModel model;

  @override
  State<HomeMobileLayout> createState() => _HomeMobileLayoutState();
}

class _HomeMobileLayoutState extends State<HomeMobileLayout>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late final TercihListModel model;

  @override
  void initState() {
    model = widget.model;
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          unselectedLabelColor: context.colorScheme.primary,
          labelColor: context.colorScheme.onPrimary,
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(color: context.colorScheme.primary),
          tabs: const [Text('Tercihlerim'), Text('Kadrolar')],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              Column(
                children: [
                  TercihSecEkle(model: model),
                  Expanded(child: TercihGorGonder(model: model)),
                ],
              ),
              const KadroListWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
