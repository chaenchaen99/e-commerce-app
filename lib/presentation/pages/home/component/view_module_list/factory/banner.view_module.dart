import 'package:flutter/material.dart';

import '../../../../../../domain/model/display/view_module/view_module.model.dart';
import 'view_module_widget.dart';

class BannerViewModule extends StatelessWidget with ViewModuleWidget {
  final ViewModule info;
  const BannerViewModule({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return info.imageUrl.isNotEmpty
        ? AspectRatio(
            aspectRatio: 375 / 79,
            child: Image.network(
              info.imageUrl,
              fit: BoxFit.fitWidth,
            ),
          )
        : SizedBox.shrink();
  }
}
