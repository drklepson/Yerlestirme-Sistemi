import 'dart:math' as math;

import 'package:drklepson_utility_package/drklepson_utility_package.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yerlestirme_update/controllers/screen_controller.dart';
import 'package:yerlestirme_update/pages/home-page/home_model.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/widgets/desktop.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/widgets/mobile.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/widgets/tablet.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/header/home_page_header.dart';

const headerMainText = 'Türkiyenin ilk ve tek Sahu Tercih Platformu 2023/1';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomePageModel(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            headerMainText,
            textAlign: TextAlign.center,
            style: (ScreenController.isMobile(context)
                    ? Theme.of(context).textTheme.titleMedium
                    : Theme.of(context).textTheme.titleLarge)
                ?.copyWith(
              color: context.colorScheme.onPrimary,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size(
              math.min<double>(960, context.width),
              ScreenController.isMobile(context) ? 70 : 108,
            ),
            child: const HomePageHeader(),
          ),
        ),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: const Expanded(
              child: ResponsiveWidget(
                desktop: HomeDesktopLayout(),
                tablet: HomeTabletLayout(),
                mobile: HomeMobileLayout(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
