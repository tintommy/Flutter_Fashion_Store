import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/product/models/color.dart';
import 'package:ecommerce_app/domain/product/entity/product.dart';

class ProductModel {
  final String categoryId;
  final List<ProductColorModel> colors;
  final Timestamp createdDate;
  final num discountedPrice;
  final int gender;
  final List<String> images;
  final num price;
  final List<String> sizes;
  final String productId;
  final int salesNumber;
  final String title;

  ProductModel(
      this.categoryId,
      this.colors,
      this.createdDate,
      this.discountedPrice,
      this.gender,
      this.images,
      this.price,
      this.sizes,
      this.productId,
      this.salesNumber,
      this.title);

  // Tạo fromJson
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      json['categoryId'] as String,
      (json['colors'] as List<dynamic>)
          .map((e) => ProductColorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['createdDate'] as Timestamp,
      (json['discountedPrice'] as num),
      json['gender'] as int,
      List<String>.from(json['images'].map((e) => e.toString())),
      (json['price'] as num),
      List<String>.from(json['sizes'].map((e) => e.toString())),
      json['productId'] as String,
      json['salesNumber'] as int,
      json['title'] as String,
    );
  }

  // Tạo toJson
  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'colors': colors.map((e) => e.toJson()).toList(),
      'createdDate': createdDate,
      'discountedPrice': discountedPrice,
      'gender': gender,
      'images': images,
      'price': price,
      'sizes': sizes,
      'productId': productId,
      'salesNumber': salesNumber,
      'title': title,
    };
  }
}

extension ProductXModel on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(categoryId, colors.map((e)=> e.toEntity()).toList(), createdDate, discountedPrice,
        gender, images, price, sizes, productId, salesNumber, title);
  }
}

extension ProductXEntity on ProductEntity {
  ProductModel fromEntity() {
    return ProductModel(categoryId, colors.map((e)=> e.fromEntity()).toList(), createdDate, discountedPrice,
        gender, images, price, sizes, productId, salesNumber, title);
  }
}