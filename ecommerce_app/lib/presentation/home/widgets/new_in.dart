import 'package:ecommerce_app/domain/product/usecases/get_new_in.dart';
import 'package:ecommerce_app/presentation/home/bloc/get_new_in_display_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/product/products_display_cubit.dart';
import '../../../common/widgets/product/product_list_item.dart';
import '../../../domain/product/usecases/get_top_selling.dart';
import '../../../service_locator.dart';
import '../bloc/top_selling_display_cubit.dart';

class NewIn extends StatelessWidget {
  const NewIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsDisplayCubit(getIt<GetTopSellingUseCase>())..displayProducts(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "Sản phẩm mới",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.deepPurpleAccent.shade100,)
          ),
          SizedBox(height: 10,),
          Container(height: 270, child: _products())
        ],
      ),
    );
  }

  Widget _products() {
    return BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
      builder: (context, state) {
        if (state is ProductsDisplayLoaded) {
          return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ProductListItem(state.products.elementAt(index));
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 5,
                );
              },
              itemCount: 5);
        }

        if (state is ProductsDisplayLoading)
          return Center(child: CircularProgressIndicator());

        if (state is ProductsDisplayFailure) return Text(state.error);

        return SizedBox.shrink();
      },
    );
  }
}
