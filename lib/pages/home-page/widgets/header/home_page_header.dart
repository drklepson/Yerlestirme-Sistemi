// ignore_for_file: unused_local_variable

import 'package:drklepson_utility_package/drklepson_utility_package.dart';
import 'package:drklepson_utility_package/tools/dialog_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yerlestirme_update/const/default_strings.dart';
import 'package:yerlestirme_update/controllers/auth_controller.dart';
import 'package:yerlestirme_update/controllers/screen_controller.dart';
import 'package:yerlestirme_update/models/kadro.dart';
import 'package:yerlestirme_update/models/user.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/header/city_code.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 960),
      height: ScreenController.isMobile(context) ? 96 : 136,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Consumer<AuthController>(
        builder: (_, value, __) => _HomePageHeader(user: value.firestoreUser),
      ),
    );
  }
}

class _HomePageHeader extends StatelessWidget {
  const _HomePageHeader({this.user});
  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(20);
    const borderRadius2 = BorderRadius.vertical(bottom: radius);
    const edgeInsets = EdgeInsets.only(bottom: 16);
    final style2 = ScreenController.isMobile(context)
        ? Theme.of(context).textTheme.bodyMedium
        : Theme.of(context).textTheme.titleMedium;
    final nameArea = Text(
      user?.name ?? 'Hata: İsim Alınamadı',
      maxLines: 1,
      textAlign: TextAlign.left,
      style: ScreenController.isMobile(context)
          ? Theme.of(context).textTheme.titleLarge
          : Theme.of(context).textTheme.displaySmall,
    );

    final kazanilanValueListenable = Consumer<AuthController>(
      builder: (context, value, child) {
        final kadroList = value.firstKadroList ?? <KadroModel?>[];

        final kazanilanKadro = kadroList.firstWhereNull(
          (element) =>
              element?.kadroId ==
              (AuthController().firestoreUser?.kazanilan ?? 'abc'),
        );

        return Text(
          kazanilanKadro?.kurum ?? DefaultStrings.yerlesemediniz,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: style2,
        );
      },
    );

    final scoreRankArea = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Puan: ${user?.puan ?? DefaultStrings.defaultPuan}',
          style: style2,
        ),
        const SizedBox(width: 16),
        Text(
          'G. Sıra:  ${user?.sira ?? DefaultStrings.defaultSira}',
          style: style2,
        ),
      ],
    );

    return Container(
      decoration: const BoxDecoration(borderRadius: borderRadius2),
      padding: edgeInsets,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PlakaHalkasi(sehir: user?.sehir),
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    nameArea,
                    kazanilanValueListenable,
                    scoreRankArea,
                  ],
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () =>
                DialogManager.futureLoading(AuthController().signOut(context))
                    .then((_) => context.pushNamedAndRemoveAll('/')),
            icon: Icon(
              Icons.exit_to_app_outlined,
              color: context.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
