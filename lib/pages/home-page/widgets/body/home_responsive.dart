import 'package:flutter/material.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/tercih_list_model.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/widgets/desktop.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/widgets/mobile.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/widgets/tablet.dart';
import 'package:yerlestirme_update/utility/widgets/advers_widget.dart';
import 'package:yerlestirme_update/utility/widgets/responsive.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final model = TercihListModel();

    return Column(
      children: [
        const BenBuradayim(),
        Expanded(
          child: Responsive(
            desktop: HomeDesktopLayout(model: model),
            tablet: HomeTabletLayout(model: model),
            mobile: HomeMobileLayout(model: model),
          ),
        ),
      ],
    );
  }
}
