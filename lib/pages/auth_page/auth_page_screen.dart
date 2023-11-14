import 'package:drklepson_utility_package/drklepson_utility_package.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yerlestirme_update/const/design_consts.dart';
import 'package:yerlestirme_update/controllers/auth_controller.dart';
import 'package:yerlestirme_update/pages/auth_page/auth_page_model.dart';
import 'package:yerlestirme_update/pages/auth_page/widgets/auth_tab_widget.dart';
import 'package:yerlestirme_update/utility/theme/constants/colors.dart';

const authBoxDecoration = BoxDecoration(
  color: CustomColors.smuddyLightLight50,
  borderRadius: borderRadiusBottom20,
);

class AuthPageScreen extends StatelessWidget {
  const AuthPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<AuthController, AuthPageModel>(
      update: (context, auth, model) =>
          model ??
          AuthPageModel(
            authController: auth,
          ),
      dispose: (context, value) => value.dispose(),
      builder: (context, child) {
        final model = context.watch<AuthPageModel>();
        final tabs =
            ['Giriş Yap', 'Kayıt Ol'].map((e) => Tab(text: e)).toList();
        final views = [
          LoginTabView(model: model),
          SignupTabView(model: model),
        ];

        final boxDecoration2 = BoxDecoration(
          color: context.colorScheme.primary,
          borderRadius: borderRadius2,
        );

        return Scaffold(
          backgroundColor: context.colorScheme.surfaceVariant,
          body: DefaultTabController(
            length: 2,
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  constraints: boxConstraints450,
                  padding: CustomInsets.horizontalEight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DecoratedBox(
                        decoration: boxDecoration2,
                        child: TabBar(tabs: tabs),
                      ),
                      SizedBox(
                        height: 400,
                        child: TabBarView(children: views),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
