import 'package:ecommerce_app/domain/category/entity/category.dart';

class CategoryModel {
  final String categoryId;
  final String image;
  final String title;

  CategoryModel(this.categoryId, this.image, this.title);

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      json['categoryId'] as String,
      json['image'] as String,
      json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'image': image,
      'title': title,
    };
  }
}

extension CategoryXModel on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(categoryId, image, title);
  }
}
