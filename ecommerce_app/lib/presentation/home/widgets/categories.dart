import 'package:ecommerce_app/common/bloc/categories/categories_display_cubit.dart';
import 'package:ecommerce_app/common/helper/images/image_display.dart';
import 'package:ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_app/core/configs/theme/app_color.dart';
import 'package:ecommerce_app/domain/category/entity/category.dart';
import 'package:ecommerce_app/presentation/all_categories/pages/all_categories.dart';
import 'package:ecommerce_app/presentation/category_products/pages/category_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesDisplayCubit()..displayCategories(),
      child: BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
        builder: (context, state) {
          if (state is CategoriesDisplayLoaded) {
            return Column(
              children: [
                _seeAll(context),
                SizedBox(
                  height: 10,
                ),
                _categories(state.categories)
              ],
            );
          }
          if (state is CategoriesDisplayFailure) {
            return Center(child: Text(state.error));
          }
          if (state is CategoriesDisplayLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return SizedBox.shrink();
        },
      ),
    );
  }

  Widget _seeAll(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Loại",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        GestureDetector(
          onTap: () {
            AppNavigator().push(context, AllCategories());
          },
          child: Text(
            "Xem tất cả",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ],
    );
  }

  Widget _categories(List<CategoryEntity> categories) {
    return Container(
      height: 100,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                AppNavigator().push(
                    context,
                    CategoryProductsPage(
                        categoryId: categories[index].categoryId,
                        categoryName: categories[index].title));
              },
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(categories[index].image))),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(categories[index].title)
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 10,
            );
          },
          itemCount: categories.length),
    );
  }
}
