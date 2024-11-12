import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../presentation/pages/main/bloc/cart_bloc/cart_bloc.dart';
import '../../../presentation/pages/main/component/widgets/svg_icon_button.dart';
import '../../theme/constant/app_colors.dart';
import '../../theme/constant/app_icons.dart';
import '../../theme/custom/custom_font_weight.dart';

const double _counterWidth = 96;

const double _counterHeight = 36;

const double _counterIconSize = 16;

const double _counterIconPadding = 8;

class CounterBtn extends StatelessWidget {
  const CounterBtn({
    super.key,
    required this.quantity,
    this.increased,
    this.decreased,
  });

  final int quantity;
  final VoidCallback? increased;
  final VoidCallback? decreased;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: _counterWidth,
      height: _counterHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.outline),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgIconButton(
            //개수 감소
            icon: AppIcons.subtract,
            color: quantity == 1
                ? AppColors.contentFourth
                : AppColors.contentPrimary,
            padding: _counterIconPadding,
            onPressed: () => decreased,
          ),
          Text('${quantity}', style: textTheme.labelLarge?.semiBold),
          SvgIconButton(
            //개수 증가
            icon: AppIcons.add,
            color: AppColors.contentPrimary,
            padding: _counterIconPadding,
            onPressed: () => increased,
          ),
        ],
      ),
    );
  }
}
