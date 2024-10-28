import '../../domain/model/display/menu/menu.model.dart';
import '../../domain/model/display/product_info/product_info.model.dart';
import '../../domain/model/display/view_module/view_module.model.dart';
import '../dto/display/menu/menu.dto.dart';
import '../dto/display/view_module/view_module.dto.dart';
import '../dto/product_info/product_info.dto.dart';

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
      time: time ?? -1,
      products: products?.map((dto) => dto.toModel()).toList() ?? [],
    );
  }
}

extension ProductInfoDtoExtension on ProductInfoDto {
  ProductInfo toModel() {
    return ProductInfo(
      productId: productId,
      title: title,
      subTitle: subTitle,
      imageUrl: imageUrl,
      price: price ?? -1,
      originalPrice: originalPrice ?? -1,
      discountRate: discountRate ?? -1,
      reviewCount: reviewCount ?? -1,
    );
  }
}
