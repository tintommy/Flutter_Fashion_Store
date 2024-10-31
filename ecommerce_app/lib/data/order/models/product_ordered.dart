import 'package:ecommerce_app/domain/order/entity/product_ordered.dart';

class ProductOrderedModel {
  final String productId;
  final String productTitle;
  final int productQuantity;
  final String productColor;
  final String productSize;
  final num productPrice;
  final num totalPrice;
  final String productImage;
  final String id;

  ProductOrderedModel(
      this.productId,
      this.productTitle,
      this.productQuantity,
      this.productColor,
      this.productSize,
      this.productPrice,
      this.totalPrice,
      this.productImage,
      this.id);

  factory ProductOrderedModel.fromJson(Map<String, dynamic> json) {
    return ProductOrderedModel(
      json['productId'] as String,
      json['productTitle'] as String,
      json['productQuantity'] as int,
      json['productColor'] as String,
      json['productSize'] as String,
      (json['productPrice'] as num).toDouble(),
      (json['totalPrice'] as num).toDouble(),
      json['productImage'] as String,
      json['id'] as String,
    );
  }

  // Hàm toJson để chuyển đối tượng AddToCartReq thành Map
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productTitle': productTitle,
      'productQuantity': productQuantity,
      'productColor': productColor,
      'productSize': productSize,
      'productPrice': productPrice,
      'totalPrice': totalPrice,
      'productImage': productImage,
      'id': id,
    };
  }
}

extension ProductOrderedXModel on ProductOrderedModel {
  ProductOrderedEntity toEntity() {
    return ProductOrderedEntity(productId, productTitle, productQuantity,
        productColor, productSize, productPrice, totalPrice, productImage, id);
  }
}

extension ProductOrderedXEntity on ProductOrderedEntity {
  ProductOrderedModel fromEntity() {
    return ProductOrderedModel(productId, productTitle, productQuantity,
        productColor, productSize, productPrice, totalPrice, productImage, id);
  }
}
