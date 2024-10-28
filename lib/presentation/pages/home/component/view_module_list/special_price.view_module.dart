import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/theme/constant/app_colors.dart';
import '../../../../../core/theme/constant/app_icons.dart';
import '../../../../../core/theme/custom/custom_font_weight.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../domain/model/display/product_info/product_info.model.dart';
import '../../../../../domain/model/display/view_module/view_module.model.dart';
import 'factory/view_module_widget.dart';
import 'widget/add_cart_button.dart';
import 'widget/timer_widget.dart';
import 'widget/view_module_padding.dart';
import 'widget/view_module_subtitle.dart';
import 'widget/view_module_title.dart';

class SpecialPriceViewModule extends StatelessWidget with ViewModuleWidget {
  final ViewModule info;
  const SpecialPriceViewModule({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: ViewModulePadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ViewModuleTitle(title: info.title),
            ViewModuleSubtitle(subtitle: info.title),
            if (info.time > 0)
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Lottie.asset(
                      AppIcons.lottie_clock,
                      width: 20,
                      delegates: LottieDelegates(
                        values: [
                          //ValueDelegate.color를 사용하여 특정 요소의 색상을 애니메이션 파일 내에서 변경
                          ValueDelegate.color(
                            ['Oval', 'Oval', 'Fill 1'],
                            value: AppColors.inversePrimary,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    TimerWidget(
                        endTime:
                            DateTime.fromMillisecondsSinceEpoch(info.time)),
                  ],
                ),
              ),
            ListView.separated(
              physics:
                  NeverScrollableScrollPhysics(), //scrollview가 자체스크롤 되지 않도록
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return _SpeacialPriceProduct(productInfo: info.products[index]);
              },
              separatorBuilder: (_, __) => SizedBox(
                height: 16,
              ),
              itemCount: info.products.length,
            )
          ],
        ),
      ),
    );
  }
}

class _SpeacialPriceProduct extends StatelessWidget {
  final ProductInfo productInfo;
  const _SpeacialPriceProduct({
    super.key,
    required this.productInfo,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            AspectRatio(
              aspectRatio: 343 / 174,
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
          productInfo.subTitle,
          style: textTheme.labelLarge
              ?.copyWith(color: AppColors.contentTertiary)
              .regular,
        ),
        Text(
          productInfo.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: textTheme.titleMedium?.titleCopyWith(),
        ),
        SizedBox(height: 4),
        Row(
          children: [
            Text(
              '${productInfo.discountRate.toString()}%',
              style: textTheme.titleLarge?.discountRateCopyWith(),
            ),
            SizedBox(width: 4),
            Text(
              productInfo.price.toWon(),
              style: textTheme.titleLarge?.priceCopyWith(),
            ),
            SizedBox(width: 4),
            Text(
              '${productInfo.originalPrice.toString()}원',
              style: textTheme.titleSmall?.originalPriceCopyWith(),
            ),
          ],
        ),
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
            Text(
              '후기 ${productInfo.reviewCount.toReview()}',
              style: textTheme.labelMedium?.reviewCountCopyWith(),
            ),
          ],
        ),
      ],
    );
  }
}
