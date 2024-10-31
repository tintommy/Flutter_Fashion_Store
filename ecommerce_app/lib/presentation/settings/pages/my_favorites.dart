import 'package:ecommerce_app/common/bloc/product/products_display_cubit.dart';
import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/domain/product/usecases/get_favorites_products.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/theme/app_color.dart';

class MyFavoritesPage extends StatelessWidget {
  const MyFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: BasicAppbar(
        title: Text("Yêu Thích"),
      ),
      body: BlocProvider(
        create: (context) =>
            ProductsDisplayCubit(getIt<GetFavoritesProductsUseCase>())
              ..displayProducts(),
        child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
          builder: (context, state) {
            if (state is ProductsDisplayLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is ProductsDisplayLoaded) {}
            if (state is ProductsDisplayFailure) {
              return Center(
                child: Text("Please try again"),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    ));
  }
}
