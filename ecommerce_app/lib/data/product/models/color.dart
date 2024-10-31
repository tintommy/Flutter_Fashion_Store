import '../../../domain/product/entity/color.dart';

class ProductColorModel {
  final String title;
  final String hexCode;

  ProductColorModel(this.title, this.hexCode);

  factory ProductColorModel.fromJson(Map<String, dynamic> json) {
    return ProductColorModel(
      json['title'] as String,
      json['hexCode'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'hexCode': hexCode,
    };
  }

}

extension ProductColorXModel on ProductColorModel {
  ProductColorEntity toEntity() {
    return ProductColorEntity(title, hexCode);
  }
}
extension ProductColorXEntity on ProductColorEntity {
  ProductColorModel fromEntity() {
    return ProductColorModel(title, hexCode);
  }
}
