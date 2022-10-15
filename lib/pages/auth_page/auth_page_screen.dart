import 'package:flutter/material.dart';
import 'package:yerlestirme_update/helpers/extensions/extension.dart';
import 'package:yerlestirme_update/pages/auth_page/auth_page_model.dart';
import 'package:yerlestirme_update/pages/auth_page/widgets/login_widget.dart';
import 'package:yerlestirme_update/pages/auth_page/widgets/signup_widget.dart';

const boxConstraints = BoxConstraints(maxWidth: 450);
const edgeInsets = EdgeInsets.symmetric(horizontal: 10);
const radius = Radius.circular(20);
const borderRadius2 = BorderRadius.vertical(top: radius);

class AuthPageScreen extends StatefulWidget {
  const AuthPageScreen({super.key});

  @override
  State<AuthPageScreen> createState() => _AuthPageScreenState();
}

class _AuthPageScreenState extends State<AuthPageScreen> {
  late AuthPageModel model;
  @override
  void initState() {
    model = AuthPageModel();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    model.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (model.userExist) {
      //Get.offAndToNamed<void>('/');
    }
    return !model.userExist
        ? const AuthResponsive()
        : const Center(
            child: SizedBox.square(
              dimension: 50,
              child: CircularProgressIndicator(),
            ),
          );
  }
}

class AuthResponsive extends StatefulWidget {
  const AuthResponsive({super.key});

  @override
  State<AuthResponsive> createState() => _AuthResponsiveState();
}

class _AuthResponsiveState extends State<AuthResponsive>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late AuthPageModel authPageModel;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    authPageModel = AuthPageModel();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    authPageModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const tabs = [
      Tab(child: Text('Giriş Yap')),
      Tab(child: Text('Kayıt Ol')),
    ];

    final views = [
      GirisMainWidget(
        model: authPageModel,
      ),
      KayitMainWidget(
        model: authPageModel,
      ),
    ];
    final boxDecoration = BoxDecoration(
      color: context.colorScheme.primary,
      borderRadius: borderRadius2,
    );
    return Scaffold(
      backgroundColor: context.colorScheme.surfaceVariant,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: boxConstraints,
            padding: edgeInsets,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DecoratedBox(
                  decoration: boxDecoration,
                  child: TabBar(
                    controller: _tabController,
                    indicator:
                        BoxDecoration(color: context.colorScheme.surface),
                    unselectedLabelColor: context.colorScheme.surface,
                    labelColor: context.colorScheme.primary,
                    tabs: tabs,
                    labelStyle: context.textTheme.headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                    unselectedLabelStyle: context.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 400,
                  child: TabBarView(
                    controller: _tabController,
                    children: views,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
