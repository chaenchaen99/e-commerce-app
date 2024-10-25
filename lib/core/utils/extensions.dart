import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../theme/constant/app_colors.dart';
import '../theme/custom/custom_font_weight.dart';
import 'constant.dart';

extension StatusX on Status {
  bool get isInitial => this == Status.initial;

  bool get isLoading => this == Status.loading;

  bool get isSuccess => this == Status.success;

  bool get isError => this == Status.error;
}

extension StringExtension on String {
  String toSnakeCase() {
    RegExp exp = RegExp(r'(?<=[a-z])[A-Z]');

    return replaceAllMapped(exp, (Match m) => ('_${m.group(0)}')).toLowerCase();
  }

  bool get isSuccess => this == 'SUCCESS';
}

extension IntExtension on int {
  String toWon() {
    //3자리마다 , 찍도록
    final priceFormat = NumberFormat('###,###,###,###원');
    return priceFormat.format(this);
  }

  String toReview() {
    return this > 9999 ? '9999+' : toString();
  }
}

extension TextStyleExtension on TextStyle {
  TextStyle? titleCopyWith() {
    return copyWith(color: AppColors.contentPrimary).regular;
  }

  TextStyle? discountRateCopyWith() {
    return copyWith(color: AppColors.secondary).bold;
  }

  TextStyle? priceCopyWith() {
    return copyWith(color: AppColors.contentPrimary).bold;
  }

  TextStyle? originalPriceCopyWith() {
    return copyWith(
      color: AppColors.contentFourth,
      decoration: TextDecoration.lineThrough,
    ).regular;
  }

  TextStyle? reviewCountCopyWith() {
    return copyWith(
      color: AppColors.contentTertiary,
    ).regular;
  }
}
