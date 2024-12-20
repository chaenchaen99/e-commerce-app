import '../../domain/model/display/cart/cart.model.dart';
import '../../domain/model/display/menu/menu.model.dart';
import '../../domain/model/display/product_info/product_info.model.dart';
import '../../domain/model/display/view_module/view_module.model.dart';
import '../dto/display/menu/menu.dto.dart';
import '../dto/display/view_module/view_module.dto.dart';
import '../dto/product_info/product_info.dto.dart';
import '../entity/display/cart/cart.entity.dart';
import '../entity/display/product_info/product_info.entity.dart';

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
      tabs: tabs,
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

// MODEL -> ENTITY
extension ProductInfoEx on ProductInfo {
  ProductInfoEntity toEntity() {
    return ProductInfoEntity(
      productId: productId,
      title: title,
      subtitle: subTitle,
      imageUrl: imageUrl,
      price: price,
      originalPrice: originalPrice,
      discountRate: discountRate,
      reviewCount: reviewCount,
    );
  }
}

/// Entity -> MODEL
extension ProductInfoEntityEx on ProductInfoEntity {
  ProductInfo toModel() {
    return ProductInfo(
      productId: productId,
      title: title,
      subTitle: subtitle,
      imageUrl: imageUrl,
      price: price,
      originalPrice: originalPrice,
      discountRate: discountRate,
      reviewCount: reviewCount,
    );
  }
}

extension CartEntityExtension on CartEntity {
  Cart toModel() {
    return Cart(product: product.toModel(), quantity: quantity);
  }
}

extension CartExtension on Cart {
  CartEntity toEntity() {
    return CartEntity(product: product.toEntity(), quantity: quantity);
  }
}
