import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/theme/constant/app_colors.dart';
import '../../../../../../core/theme/constant/app_icons.dart';
import '../../../../../../core/theme/custom/custom_font_weight.dart';
import '../../../../../../core/theme/custom/custom_theme.dart';
import '../../../../../../domain/model/display/product_info/product_info.model.dart';
import '../../../bloc/cart_bloc/cart_bloc.dart';
import '../../../component/widgets/svg_icon_button.dart';
import '../../../../../../core/utils/extensions.dart';

const double _counterHeight = 36;
const double _counterWidth = 96;
const double _iconSize = 16;
const double _iconPadding = 8;

class CartPriceInfo extends StatelessWidget {
  const CartPriceInfo({
    super.key,
    required this.productInfo,
    required this.quantity,
  });

  final ProductInfo productInfo;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      child: Column(
        children: [
          Text(
            productInfo.title,
            style: textTheme.titleSmall,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    productInfo.price.toWon(),
                    style: textTheme.titleMedium?.priceCopyWith(),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    productInfo.originalPrice.toWon(),
                    style: textTheme.titleMedium?.originalPriceCopyWith(),
                  ),
                ],
              ),
              Container(
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
                      padding: _iconPadding,
                      onPressed: () =>
                          context.read<CartBloc>().add(CartQuantityDecreased()),
                    ),
                    Text(
                      '${quantity}',
                      style: textTheme.labelLarge.semiBold?.copyWith(
                        color: AppColors.contentPrimary,
                      ),
                    ),
                    SvgIconButton(
                      //개수 증가
                      icon: AppIcons.add,
                      color: AppColors.contentPrimary,
                      padding: _iconPadding,
                      onPressed: () =>
                          context.read<CartBloc>().add(CartQuantityIncreased()),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(thickness: 1),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                decoration: BoxDecoration(
                  color: Color(0xFFF5C142),
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                ),
                child: Text(
                  '적립',
                  style: textTheme.labelSmall.semiBold
                      ?.copyWith(color: AppColors.background),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '로그인 후, 할인 및 적립 혜택 적용',
                style: textTheme.labelMedium
                    ?.copyWith(color: AppColors.contentSecondary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
