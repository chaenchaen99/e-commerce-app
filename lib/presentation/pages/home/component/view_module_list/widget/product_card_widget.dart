import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/theme/constant/app_colors.dart';
import '../../../../../../core/theme/constant/app_icons.dart';
import '../../../../../../core/utils/extensions.dart';
import '../../../../../../domain/model/display/product_info/product_info.model.dart';
import 'add_cart_button.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductInfo productInfo;
  final double imageAspect;

  const ProductCardWidget({
    super.key,
    required this.productInfo,
    required this.imageAspect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            AspectRatio(
              aspectRatio: imageAspect,
              child: Image.network(
                productInfo.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            AddCartButton(),
          ],
        ),
        SizedBox(height: 9),
        Text(
          productInfo.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        Row(
          children: [
            Text('${productInfo.discountRate}%'),
            SizedBox(width: 4),
            Text(productInfo.price.toWon()),
          ],
        ),
        SizedBox(height: 2),
        Text(productInfo.originalPrice.toString()),
        SizedBox(height: 8),
        Row(
          children: [
            SvgPicture.asset(
              AppIcons.chat,
              width: 13,
              height: 13,
              colorFilter: ColorFilter.mode(
                AppColors.contentTertiary,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Text('후기 ${productInfo.reviewCount.toReview()}'),
          ],
        ),
      ],
    );
  }
}
