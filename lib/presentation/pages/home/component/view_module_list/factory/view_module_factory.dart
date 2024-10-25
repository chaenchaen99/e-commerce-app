import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/utils/extensions.dart';
import '../../../../../../domain/model/display/view_module/view_module.model.dart';
import '../carousel.view_module.dart';
import '../scroll.view_module.dart';
import '../view_module_A.dart';
import '../view_module_B.dart';
import '../view_module_C.dart';
import '../view_module_D.dart';
import '../view_module_E.dart';
import '../view_module_NONE.dart';
import 'banner.view_module.dart';
import 'view_module_widget.dart';

enum Modules {
  viewModuleA,
  viewModuleB,
  viewModuleC,
  viewModuleD,
  viewModuleE,
  carouselViewModule,
  bannerviewModule,
  scrollViewModule,
}

class ViewModuleFactory {
  Widget textToWidget(ViewModule viewModule) {
    final String type = viewModule.type.toSnakeCase();
    for (final module in Modules.values) {
      final name = module.name.toSnakeCase();
      if (name.contains(type)) {
        return module.toWidget(viewModule) as Widget;
      }
    }

    return const ViewModuleNone();
  }
}

extension ModulesExtension on Modules {
  ViewModuleWidget toWidget(ViewModule info) {
    switch (this) {
      case Modules.viewModuleA:
        return ViewModuleA();
      case Modules.viewModuleB:
        return ViewModuleB();
      case Modules.viewModuleC:
        return ViewModuleC();
      case Modules.viewModuleD:
        return ViewModuleD();
      case Modules.viewModuleE:
        return ViewModuleE();
      case Modules.carouselViewModule:
        return CarouselViewModule(info: info);
      case Modules.bannerviewModule:
        return BannerViewModule(info: info);
      case Modules.scrollViewModule:
        return ScrollViewModule(info: info);
    }
  }
}
