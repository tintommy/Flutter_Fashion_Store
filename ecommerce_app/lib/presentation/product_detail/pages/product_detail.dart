import 'package:ecommerce_app/common/bloc/button/button_cubit.dart';
import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/domain/product/entity/product.dart';
import 'package:ecommerce_app/presentation/product_detail/bloc/favorite_icon_cubit.dart';
import 'package:ecommerce_app/presentation/product_detail/bloc/product_color_selection_cubit.dart';
import 'package:ecommerce_app/presentation/product_detail/bloc/product_quantity_cubit.dart';
import 'package:ecommerce_app/presentation/product_detail/bloc/product_size_selection_cubit.dart';
import 'package:ecommerce_app/presentation/product_detail/widgets/add_to_cart.dart';
import 'package:ecommerce_app/presentation/product_detail/widgets/favorite_button.dart';
import 'package:ecommerce_app/presentation/product_detail/widgets/product_color.dart';
import 'package:ecommerce_app/presentation/product_detail/widgets/product_images.dart';
import 'package:ecommerce_app/presentation/product_detail/widgets/product_quantity.dart';
import 'package:ecommerce_app/presentation/product_detail/widgets/product_title.dart';
import 'package:ecommerce_app/presentation/product_detail/widgets/selected_color.dart';
import 'package:ecommerce_app/presentation/product_detail/widgets/selected_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/theme/app_color.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage(this.productEntity);

  ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductQuantityCubit(),
        ),
        BlocProvider(
          create: (context) => ProductColorSelectionCubit(),
        ),
        BlocProvider(
          create: (context) => ProductSizeSelectionCubit(),
        ),
        BlocProvider(create: (context) => ButtonCubit()),
        BlocProvider(create: (context) => FavoriteIconCubit()..isFavorite(productEntity.productId)),
      ],
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: BasicAppbar(
          hideBack: false,
          action: FavoriteButton(product: productEntity),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProductImages(productEntity.images),
                SizedBox(
                  height: 10,
                ),
                ProductTitle(productEntity),
                SizedBox(
                  height: 20,
                ),
                SelectedSize(productEntity),
                SizedBox(
                  height: 10,
                ),
                SelectedColor(productEntity: productEntity),
                SizedBox(
                  height: 10,
                ),
                ProductQuantity(productEntity),
                SizedBox(
                  height: 40,
                ),
                AddToCart(productEntity: productEntity)
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
