// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_info.entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductInfoEntityAdapter extends TypeAdapter<ProductInfoEntity> {
  @override
  final int typeId = 0;

  @override
  ProductInfoEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductInfoEntity(
      productId: fields[0] == null ? '' : fields[0] as String,
      title: fields[1] == null ? '' : fields[1] as String,
      subtitle: fields[3] == null ? '' : fields[3] as String,
      imageUrl: fields[2] == null ? '' : fields[2] as String,
      price: fields[4] == null ? -1 : fields[4] as int,
      originalPrice: fields[5] == null ? -1 : fields[5] as int,
      discountRate: fields[6] == null ? -1 : fields[6] as int,
      reviewCount: fields[7] == null ? -1 : fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ProductInfoEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.productId)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.subtitle)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.originalPrice)
      ..writeByte(6)
      ..write(obj.discountRate)
      ..writeByte(7)
      ..write(obj.reviewCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductInfoEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
