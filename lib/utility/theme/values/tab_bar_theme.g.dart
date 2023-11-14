part of '../theme.dart';

const radius = Radius.circular(20);
const borderRadius2 = BorderRadius.vertical(top: radius);

class _CustomTabBarTheme extends TabBarTheme {
  const _CustomTabBarTheme()
      : super(
          indicator: const BoxDecoration(
            color: CustomColors.smuddyLightLight50,
            borderRadius: borderRadius2,
          ),
          unselectedLabelColor: CustomColors.smuddyGreenGreen50,
          labelColor: CustomColors.smuddyGreenGreen700,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
        );
}
