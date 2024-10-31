import 'package:ecommerce_app/common/bloc/product/products_display_cubit.dart';
import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/core/configs/theme/app_color.dart';
import 'package:ecommerce_app/domain/product/entity/product.dart';
import 'package:ecommerce_app/presentation/search/widgets/search_field.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/product/product_list_item.dart';
import '../../../domain/product/usecases/get_products_by_title.dart';
import '../../../service_locator.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) =>
          ProductsDisplayCubit(getIt<GetProductsByTitleUseCase>()),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: BasicAppbar(
          height: 80,
          title: SearchField(),
        ),
        body: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
          builder: (context, state) {
            if (state is ProductsDisplayLoading)
              return Center(child: CircularProgressIndicator());
            if (state is ProductsDisplayFailure) return Text(state.error);
            if (state is ProductsDisplayLoaded) {
              return state.products.isEmpty
                  ? _notFound()
                  : _products(state.products);
            }

            return Container();
          },
        ),
      ),
    ));
  }

  Widget _products(List<ProductEntity> products) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductListItem(products[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _notFound() {
    return Padding(
      padding: EdgeInsets.all(40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/no_item_found.png",
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Không tìm thấy sản phẩm !",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
