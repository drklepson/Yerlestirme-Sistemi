import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:yerlestirme_update/controllers/screen_controller.dart';
import 'package:yerlestirme_update/helpers/extensions/context_extension.g.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/home_responsive.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/header/home_page_header.dart';

const headerMainText = 'Türkiyenin ilk ve tek Sahu Tercih Platformu 2022/2';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          headerMainText,
          textAlign: TextAlign.center,
          style: ScreenController.isMobile(context)
              ? Theme.of(context).textTheme.titleMedium
              : Theme.of(context).textTheme.titleLarge,
        ),
        bottom: PreferredSize(
          preferredSize: Size(
            math.min<double>(960, context.width),
            ScreenController.isMobile(context) ? 60 : 108,
          ),
          child: const HomePageHeader(),
        ),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: const HomePageBody(),
        ),
      ),
    );
  }
}
