import 'package:ecommerce_app/common/helper/cart/cart.dart';
import 'package:ecommerce_app/common/helper/extension.dart';
import 'package:ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_app/domain/order/entity/product_ordered.dart';
import 'package:ecommerce_app/presentation/cart/pages/checkout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_color.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key, required this.products});

  final List<ProductOrderedEntity> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height / 3,
      color: AppColors.darkBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Subtotal",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Text(
                CartHelper.calculateCartSubTotal(products)
                    .formatWithThousandSeparator()
                    .toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shipping Cost",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Text(
                "8,000",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tax",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Text(
                "0.0",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Text(
                (CartHelper.calculateCartSubTotal(products) + 8000)
                    .formatWithThousandSeparator()
                    .toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )
            ],
          ),
          ElevatedButton(
            onPressed: () {
              AppNavigator().push(
                  context,
                  CheckoutPage(
                      products: products,
                      total: (CartHelper.calculateCartSubTotal(products) + 8000)
                          .formatWithThousandSeparator()
                          .toString()));
            },
            child: Text("Checkout"),
            style: ElevatedButton.styleFrom(),
          )
        ],
      ),
    );
  }
}
