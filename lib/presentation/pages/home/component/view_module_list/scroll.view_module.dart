import 'package:flutter/material.dart';

import '../../../../../domain/model/display/view_module/view_module.model.dart';
import 'factory/view_module_widget.dart';
import 'widget/product_card_widget.dart';

class ScrollViewModule extends StatelessWidget with ViewModuleWidget {
  final ViewModule info;
  const ScrollViewModule({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return ProductCardWidget(
      productInfo: info.products[0],
      imageAspect: 150 / 195,
    );
  }
}