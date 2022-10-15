// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:yerlestirme_update/const/default_strings.dart';
import 'package:yerlestirme_update/controllers/auth_controller.dart';
import 'package:yerlestirme_update/controllers/screen_controller.dart';
import 'package:yerlestirme_update/helpers/extensions/extension.dart';
import 'package:yerlestirme_update/models/kadro.dart';
import 'package:yerlestirme_update/models/user.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/header/widgets/city_code.dart';

extension ForListWhereNull<T> on List<T> {
  T? firstWhereNull(bool Function(T element) rule) {
    if (isEmpty) return null;
    for (final i in this) {
      if (rule.call(i)) {
        return i;
      }
    }
    return null;
  }
}

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 960),
      height: ScreenController.isMobile(context) ? 86 : 136,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ValueListenableBuilder<AuthController>(
        valueListenable: AuthController(),
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
    final nameArea = Text(
      user?.name ?? 'Hata: İsim Alınamadı',
      maxLines: 1,
      textAlign: TextAlign.left,
      style: ScreenController.isMobile(context)
          ? Theme.of(context).textTheme.titleLarge
          : Theme.of(context).textTheme.displaySmall,
    );

    final kazanilanValueListenable = ValueListenableBuilder<AuthController>(
      valueListenable: AuthController(),
      builder: (context, value, child) {
        final kadroList = value.firstKadroList ?? <KadroModel?>[];

        final kazanilanKadro = kadroList.firstWhereNull(
          (element) =>
              element?.kadroId ==
              (AuthController.to.firestoreUser?.kazanilan ?? 'abc'),
        );

        return Text(
          kazanilanKadro?.kurum ?? DefaultStrings.yerlesemediniz,
          maxLines: 1,
          style: ScreenController.isDekstop(context)
              ? Theme.of(context).textTheme.headlineSmall
              : ScreenController.isTablet(context)
                  ? Theme.of(context).textTheme.titleLarge
                  : Theme.of(context).textTheme.labelSmall,
        );
      },
    );

    final scoreRankArea = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Puan: ${user?.puan ?? DefaultStrings.defaultPuan}',
          style: ScreenController.isDekstop(context)
              ? Theme.of(context).textTheme.headlineSmall
              : ScreenController.isTablet(context)
                  ? Theme.of(context).textTheme.titleLarge
                  : Theme.of(context).textTheme.labelSmall,
        ),
        Text(
          'G. Sıra:  ${user?.sira ?? DefaultStrings.defaultSira}',
          style: ScreenController.isDekstop(context)
              ? Theme.of(context).textTheme.headlineSmall
              : ScreenController.isTablet(context)
                  ? Theme.of(context).textTheme.titleLarge
                  : Theme.of(context).textTheme.labelSmall,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                nameArea,
                kazanilanValueListenable,
                scoreRankArea,
              ],
            ),
          ),
          IconButton(
            onPressed: () =>
                context.loading(AuthController.to.signOut(context)),
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
