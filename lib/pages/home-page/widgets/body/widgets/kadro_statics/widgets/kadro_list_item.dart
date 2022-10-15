import 'package:flutter/material.dart';
import 'package:yerlestirme_update/controllers/auth_controller.dart';
import 'package:yerlestirme_update/helpers/global_variables.dart';
import 'package:yerlestirme_update/models/kadro.dart';
import 'package:yerlestirme_update/models/user.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/widgets/kadro_statics/widgets/people_list_header.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/widgets/kadro_statics/widgets/people_list_item.dart';

class KadroListExpansionItem extends StatelessWidget {
  const KadroListExpansionItem({
    super.key,
    required this.kazananlar,
    required this.gelenKadro,
    required this.tercihEdenler,
  });

  final List<String?>? kazananlar;
  final KadroModel? gelenKadro;
  final List<String?>? tercihEdenler;

  @override
  Widget build(BuildContext context) {
    final kurumText = Text(
      gelenKadro?.kurum ?? '',
      maxLines: 1,
      style: Theme.of(context).textTheme.titleMedium,
    );
    final staticsText = Text(
      'Yerleşen : ${kazananlar?.length ?? 0} / Kontenjan : ${gelenKadro?.kontenjan}',
      style: Theme.of(context).textTheme.titleSmall,
    );
    return ExpansionTile(
      childrenPadding: const EdgeInsets.symmetric(horizontal: 10),
      tilePadding: const EdgeInsets.symmetric(horizontal: 10),
      title: kurumText,
      subtitle: staticsText,
      children: [
        const PeopleListHeaders(),
        ListView.builder(
          shrinkWrap: true,
          itemCount: kazananlar?.length ?? 0,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, kazanSira) {
            final kazanan = gelenKadro?.kazananlar?.elementAt(kazanSira);

            return kazanan != null
                ? FutureBuilder<UserModel?>(
                    future: AuthController.to.getUserWithID(kazanan),
                    builder: (context, snapshot) =>
                        Globals.futureBuilderWidget<UserModel?>(
                      context,
                      snapshot,
                      (data) => data != null
                          ? PeopleListItem(
                              user: data,
                              index: kazanSira + 1,
                            )
                          : const SizedBox.shrink(),
                    ),
                  )
                : const Text('TercihEdenBoş');
          },
        ),
        Divider(
          height: 5,
          thickness: 5,
          color: Theme.of(context).primaryColor,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: tercihEdenler?.length ?? 0,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, tercihSira) {
            final tercihEden = tercihEdenler?.elementAt(tercihSira);
            if (tercihEden == null) return const SizedBox.shrink();
            return FutureBuilder<UserModel?>(
              future: AuthController.to.getUserWithID(tercihEden),
              builder: (context, snapshot) =>
                  Globals.futureBuilderWidget<UserModel?>(
                context,
                snapshot,
                (data) => data != null
                    ? PeopleListItem(
                        user: data,
                        index: tercihSira + 1 + (kazananlar?.length ?? 0),
                      )
                    : const SizedBox.shrink(),
              ),
            );
          },
        ),
      ],
    );
  }
}
