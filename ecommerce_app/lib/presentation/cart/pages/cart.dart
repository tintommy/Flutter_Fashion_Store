import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/core/configs/theme/app_color.dart';
import 'package:ecommerce_app/presentation/cart/bloc/cart_products_display_cubit.dart';
import 'package:ecommerce_app/presentation/cart/widgets/check_out.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/order/entity/product_ordered.dart';
import '../widgets/product_ordered_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: BasicAppbar(
        title: Text(
          "Giỏ hàng",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocProvider(
        create: (context) => CartProductsDisplayCubit()..displayCartProducts(),
        child: BlocBuilder<CartProductsDisplayCubit, CartProductsDisplayState>(
          builder: (context, state) {
            if (state is CartProductsLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is CartProductsLoaded) {
              return Stack(children: [
                _products(state.products),
                (state.products.isNotEmpty)
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: CheckOut(products: state.products),
                      )
                    : SizedBox.shrink(),
                (state.products.isEmpty)
                    ? Align(
                        alignment: Alignment.center,
                        child: Container(
                            width: 250,
                            height: 250,
                            child: Image.asset("assets/images/empty_cart.png",
                                fit: BoxFit.cover)),
                      )
                    : SizedBox.shrink()
              ]);
            }
            if (state is LoadCartProductsFailure) {
              return Center(child: Text(state.error));
            }

            return SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _products(List<ProductOrderedEntity> products) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ProductOrderedCard(product: products[index]),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 10);
        },
        itemCount: products.length);
  }
}
