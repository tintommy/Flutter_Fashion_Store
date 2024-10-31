import 'package:ecommerce_app/common/helper/extension.dart';
import 'package:ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_app/domain/product/entity/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../presentation/product_detail/pages/product_detail.dart';

class ProductListItem extends StatelessWidget {
  final ProductEntity product;

  ProductListItem(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        AppNavigator().push(context, ProductDetailPage(product));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white24),
        height: 270,
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.network(
                product.images[0],
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        product.discountedPrice != 0
                            ? Row(
                                children: [
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: "đ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11)),
                                    TextSpan(
                                        text: product.discountedPrice
                                            .formatWithThousandSeparator(),
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white)),
                                  ])),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: "đ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11)),
                                    TextSpan(
                                        text: product.price
                                            .formatWithThousandSeparator(),
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
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
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11)),
                                TextSpan(
                                    text: product.price
                                        .formatWithThousandSeparator(),
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white))
                              ])),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
