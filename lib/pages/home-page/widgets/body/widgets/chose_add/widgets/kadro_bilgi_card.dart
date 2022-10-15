import 'package:flutter/material.dart';
import 'package:yerlestirme_update/models/kadro.dart';
import 'package:yerlestirme_update/pages/home-page/widgets/body/tercih_list_model.dart';

class TercihBilgiCard extends StatelessWidget {
  const TercihBilgiCard({
    super.key,
    this.seciliKadro,
    required this.width,
    this.onAdded,
    required this.kadroUyari,
    required this.model,
  });

  final KadroModel? seciliKadro;
  final double width;
  final bool kadroUyari;
  final VoidCallback? onAdded;
  final TercihListModel model;

  void tercihEkleBtnFn() {
    if (seciliKadro != null) model.tercihEkle(seciliKadro!);

    onAdded?.call();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Stack(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.home_work_outlined,
                      size: 36,
                    ),
                    title: Text(
                      seciliKadro?.kurum ?? 'Kadro Seçiniz',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    trailing: FloatingActionButton(
                      mini: true,
                      onPressed: kadroUyari ? null : tercihEkleBtnFn,
                      child: Icon(
                        kadroUyari
                            ? Icons.person_add_disabled_outlined
                            : Icons.add,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
