import 'package:flutter/material.dart';
import 'package:yerlestirme_update/models/kadro.dart';
import 'package:yerlestirme_update/pages/home-page/home_model.dart';

class TercihBilgiCard extends StatelessWidget {
  const TercihBilgiCard({
    required this.width,
    required this.kadroUyari,
    required this.model,
    super.key,
    this.seciliKadro,
    this.onAdded,
  });

  final KadroModel? seciliKadro;
  final double width;
  final bool kadroUyari;
  final VoidCallback? onAdded;
  final HomePageModel model;

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
