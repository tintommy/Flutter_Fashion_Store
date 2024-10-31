import 'package:ecommerce_app/common/helper/extension.dart';
import 'package:ecommerce_app/domain/product/entity/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  final ProductEntity productEntity;

  ProductTitle(this.productEntity);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productEntity.title,
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        productEntity.discountedPrice != 0
            ? Row(
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "đ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 11)),
                    TextSpan(
                        text: productEntity.discountedPrice
                            .formatWithThousandSeparator(),
                        style: TextStyle(fontSize: 15, color: Colors.purple.shade100)),
                  ])),
                  SizedBox(
                    width: 5,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "đ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 11)),
                    TextSpan(
                        text: productEntity.price.formatWithThousandSeparator(),
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 3,
                            decorationColor: Colors.red,
                            fontSize: 15,
                            color: Colors.white))
                  ]))
                ],
              )
            : RichText(
                text: TextSpan(children: [
                TextSpan(
                    text: "đ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                TextSpan(
                    text: productEntity.price.formatWithThousandSeparator(),
                    style: TextStyle(fontSize: 15, color: Colors.purple.shade100))
              ])),
      ],
    );
  }
}
