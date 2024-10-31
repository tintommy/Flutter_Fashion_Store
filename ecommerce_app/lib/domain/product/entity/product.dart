import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/domain/product/entity/color.dart';

import '../../../data/product/models/color.dart';

class ProductEntity{
  final String categoryId;
  final List<ProductColorEntity> colors;
  final Timestamp createdDate;
  final num discountedPrice;
  final int gender;
  final List<String> images;
  final num price;
  final List<String> sizes;
  final String productId;
  final int salesNumber;
  final String title;

  ProductEntity(
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

}