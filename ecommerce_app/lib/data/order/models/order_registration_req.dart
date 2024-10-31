import 'package:ecommerce_app/data/order/models/product_ordered.dart';
import 'package:ecommerce_app/domain/order/entity/product_ordered.dart';

class OrderRegistrationReq {
  final List<ProductOrderedEntity> products;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;

  OrderRegistrationReq(
      this.products, this.createdDate, this.itemCount, this.totalPrice, this.shippingAddress);

  // Tạo fromJson
  factory OrderRegistrationReq.fromJson(Map<String, dynamic> json) {
    return OrderRegistrationReq(
      (json['products'] as List<dynamic>)
          .map((e) => ProductOrderedModel.fromJson(e as Map<String, dynamic>)
              .toEntity())
          .toList(),
      json['createdDate'] as String,
      json['itemCount'] as int,
      (json['totalPrice'] as num).toDouble(),
      json['shippingAddress'] as String,
    );
  }

  // Tạo toJson
  Map<String, dynamic> toJson() {
    return {
      'products': products.map((e) => e.fromEntity().toJson()).toList(),
      'createdDate': createdDate,
      'itemCount': itemCount,
      'totalPrice': totalPrice,
      'shippingAddress':shippingAddress
    };
  }
}
