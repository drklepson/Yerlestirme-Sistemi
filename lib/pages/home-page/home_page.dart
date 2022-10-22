import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:yerlestirme_update/controllers/screen_controller.dart';
import 'package:yerlestirme_update/helpers/extensions/extension.dart';
import 'package:yerlestirme_update/pages/home-page/home_model.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/home_responsive.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/header/home_page_header.dart';

const headerMainText = 'Türkiyenin ilk ve tek Sahu Tercih Platformu 2022/2';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageModel model;

  @override
  void initState() {
    model = HomePageModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (!model.userExist) context.pushNamedAndRemoveAll('/auth');
      },
    );
    return model.userExist
        ? Scaffold(
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
                  ScreenController.isMobile(context) ? 70 : 108,
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
          )
        : const Center(
            child: SizedBox.square(
              dimension: 50,
              child: CircularProgressIndicator(),
            ),
          );
  }
}
