import 'package:ecommerce_app/common/bloc/product/products_display_cubit.dart';
import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/common/widgets/product/product_list_item.dart';
import 'package:ecommerce_app/data/product/source/product_firebase_service.dart';
import 'package:ecommerce_app/domain/product/usecases/get_products_by_category_id.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/theme/app_color.dart';
import '../../../service_locator.dart';

class CategoryProductsPage extends StatelessWidget {
  final String categoryId;
  final String categoryName;

  const CategoryProductsPage(
      {super.key, required this.categoryId, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BasicAppbar(),
        backgroundColor: AppColors.scaffoldBackground,
        body: BlocProvider(
          create: (context) => ProductsDisplayCubit(
            getIt<GetProductsByCategoryIdUseCase>(),
          )..displayProducts(params: categoryId),
          child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
            builder: (context, state) {
              if (state is ProductsDisplayLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is ProductsDisplayLoaded) {
                return Container(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          categoryName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 0.8),
                            itemCount: state.products.length,
                            itemBuilder: (context, index) {
                              return ProductListItem(state.products[index]);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
