import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/theme/constant/app_colors.dart';
import '../../../../../../domain/model/display/product_info/product_info.model.dart';
import '../../../bloc/cart_bloc/cart_bloc.dart';

const double _imageSize = 48;

class CartProductInfo extends StatelessWidget {
  const CartProductInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productInfo = context.watch<CartBloc>().state.productInfo;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Row(
        children: [
          Image.network(
            productInfo.imageUrl,
            width: _imageSize,
            height: _imageSize,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              children: [
                Text(
                  productInfo.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: AppColors.contentPrimary),
                ),
                SizedBox(height: 4),
                Text(
                  productInfo.subTitle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: AppColors.contentTertiary,
                      ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
