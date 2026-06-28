// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    _CartItemModel(
      id: (json['id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      products: CartProductModel.fromJson(
        json['products'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$CartItemModelToJson(_CartItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'product_id': instance.productId,
      'products': instance.products,
    };

_CartProductModel _$CartProductModelFromJson(Map<String, dynamic> json) =>
    _CartProductModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['image_url'] as String?,
      stock: (json['stock'] as num).toInt(),
      isActive: json['is_active'] as bool,
    );

Map<String, dynamic> _$CartProductModelToJson(_CartProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'image_url': instance.imageUrl,
      'stock': instance.stock,
      'is_active': instance.isActive,
    };
