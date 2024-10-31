import 'package:ecommerce_app/common/bloc/button/button_cubit.dart';
import 'package:ecommerce_app/common/helper/extension.dart';
import 'package:ecommerce_app/common/helper/product/product_price.dart';
import 'package:ecommerce_app/data/order/models/add_to_cart_request.dart';
import 'package:ecommerce_app/domain/order/usecases/add_to_cart.dart';
import 'package:ecommerce_app/presentation/product_detail/bloc/product_color_selection_cubit.dart';
import 'package:ecommerce_app/presentation/product_detail/bloc/product_quantity_cubit.dart';
import 'package:ecommerce_app/presentation/product_detail/bloc/product_size_selection_cubit.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/theme/app_color.dart';
import '../../../domain/product/entity/product.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<ButtonCubit>().execute(
            usecase: getIt<AddToCartUseCase>(),
            params: AddToCartReq(
                productEntity.productId,
                productEntity.title,
                context.read<ProductQuantityCubit>().state,
                productEntity
                    .colors[context.read<ProductColorSelectionCubit>().state]
                    .title,
                productEntity
                    .sizes[context.read<ProductSizeSelectionCubit>().state],
                ProductPriceHelper().provideCurrentPrice(productEntity),
                context.read<ProductQuantityCubit>().state *
                    ProductPriceHelper().provideCurrentPrice(productEntity),
                productEntity.images[0]));
      },
      child: BlocListener<ButtonCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Thêm sản phẩm vào giỏ thành công"),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating));
            }

            if (state is ButtonLoadingState) {}

            if (state is ButtonFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    "Đã xảy ra lỗi",
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating));
            }
          },
          child: Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.darkPrimary),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<ProductQuantityCubit, int>(
                  builder: (context, state) {
                    return Text(
                      "${(ProductPriceHelper().provideCurrentPrice(productEntity) * state).formatWithThousandSeparator().toString()}đ",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    );
                  },
                ),
                Text(
                  "Thêm vào giỏ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )),
    );
  }
}
