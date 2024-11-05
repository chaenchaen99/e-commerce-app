import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/theme/constant/app_colors.dart';
import '../../../../../../core/theme/constant/app_icons.dart';
import '../../../../../../domain/model/display/product_info/product_info.model.dart';
import '../../../../main/bloc/cart_bloc/cart_bloc.dart';

class AddCartButton extends StatelessWidget {
  final ProductInfo productInfo;
  const AddCartButton({super.key, required this.productInfo});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 8,
      bottom: 8,
      child: GestureDetector(
        onTap: () => context.read<CartBloc>().add(CartOpened(productInfo)),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.47),
            shape: BoxShape.circle,
          ),
          width: 32,
          height: 32,
          child: Center(
            child: SvgPicture.asset(
              AppIcons.cart,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                AppColors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
