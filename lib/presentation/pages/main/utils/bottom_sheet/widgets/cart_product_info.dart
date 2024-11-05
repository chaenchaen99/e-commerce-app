import 'package:flutter/material.dart';

import '../../../../../../core/theme/constant/app_colors.dart';
import '../../../../../../domain/model/display/product_info/product_info.model.dart';

const double _imageSize = 48;

class CartProductInfo extends StatelessWidget {
  final ProductInfo productInfo;
  const CartProductInfo({Key? key, required this.productInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
