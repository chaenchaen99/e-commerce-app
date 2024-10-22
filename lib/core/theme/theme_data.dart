import 'package:flutter/material.dart';

import 'constant/app_colors.dart';
import 'custom/custom_font_weight.dart';
import 'custom/custom_theme.dart';

class CustomThemeData {
  static ThemeData get themeData => ThemeData(
        useMaterial3: true,
        fontFamily: 'Pretendard',
        textTheme: CustomTheme.textTheme,
        dividerTheme: DividerThemeData(color: AppColors.outline),
        tabBarTheme: TabBarTheme(
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(color: AppColors.primary, width: 2),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: AppColors.primary,
          labelStyle: CustomTheme.textTheme.titleSmall.semiBold,
          unselectedLabelColor: AppColors.contentSecondary,
          unselectedLabelStyle: CustomTheme.textTheme.titleSmall,
          overlayColor: WidgetStatePropertyAll<Color>(
            Colors.grey[300] ?? Colors.grey,
          ),
        ),
      );
}