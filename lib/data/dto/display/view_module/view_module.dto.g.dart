// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_module.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ViewModuleDtoImpl _$$ViewModuleDtoImplFromJson(Map<String, dynamic> json) =>
    _$ViewModuleDtoImpl(
      type: json['type'] as String? ?? '',
      title: json['title'] as String? ?? '',
      subTitle: json['subTitle'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      time: (json['time'] as num?)?.toInt() ?? -1,
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => ProductInfoDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductInfoDto>[],
    );

Map<String, dynamic> _$$ViewModuleDtoImplToJson(_$ViewModuleDtoImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'imageUrl': instance.imageUrl,
      'time': instance.time,
      'products': instance.products,
    };
