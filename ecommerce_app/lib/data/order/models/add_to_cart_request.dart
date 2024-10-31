class AddToCartReq{
  final String productId;
  final String productTitle;
  final int productQuantity;
  final String productColor;
  final String productSize;
  final num productPrice;
  final num totalPrice;
  final String productImage;

  AddToCartReq(this.productId, this.productTitle, this.productQuantity,
      this.productColor, this.productSize, this.productPrice, this.totalPrice, this.productImage);

  factory AddToCartReq.fromJson(Map<String, dynamic> json) {
    return AddToCartReq(
      json['productId'] as String,
      json['productTitle'] as String,
      json['productQuantity'] as int,
      json['productColor'] as String,
      json['productSize'] as String,
      (json['productPrice'] as num).toDouble(),
      (json['totalPrice'] as num).toDouble(),
      json['productImage'] as String,
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
    };
  }
}