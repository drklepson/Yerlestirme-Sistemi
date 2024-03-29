import 'package:flutter/material.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/widgets/chose_add/tercih_sec_ekle.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/widgets/kadro_statics/kadrolist_widget.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/widgets/see_and_send/tercih_gor_gonder.dart';

class HomeTabletLayout extends StatelessWidget {
  const HomeTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => const Row(
        children: [
          Expanded(
            child: Column(
              children: [
                TercihSecEkle(),
                Expanded(child: TercihGorGonder()),
              ],
            ),
          ),
          Expanded(child: KadroListWidget()),
        ],
      ),
    );
  }
}
