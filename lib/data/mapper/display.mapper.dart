import '../../domain/model/display/menu/menu.model.dart';
import '../../domain/model/display/view_module/view_module.model.dart';
import '../dto/display/menu/menu.dto.dart';
import '../dto/display/view_module/view_module.dto.dart';

extension MenuExtension on MenuDto {
  Menu toModel() {
    return Menu(
      tabId: tabId,
      title: title,
    );
  }
}

extension ViewModuleExtension on ViewModuleDto {
  ViewModule toModel() {
    return ViewModule(
      type: type,
      title: title,
      subTitle: subTitle,
      imageUrl: imageUrl,
    );
  }
}
