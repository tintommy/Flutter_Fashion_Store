import 'package:ecommerce_app/core/configs/theme/app_color.dart';
import 'package:ecommerce_app/domain/product/entity/product.dart';
import 'package:ecommerce_app/presentation/product_detail/bloc/product_size_selection_cubit.dart';
import 'package:ecommerce_app/presentation/product_detail/widgets/product_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/helper/bottomsheet/app_bottomsheet.dart';

class SelectedSize extends StatelessWidget {
  SelectedSize(this.productEntity);

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomSheet.display(
            context,
            BlocProvider.value(
              value: BlocProvider.of<ProductSizeSelectionCubit>(context),
              child: ProductSize(productEntity: productEntity),
            ));
      },
      child: Container(
        height: 60,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColors.darkSecondBackground),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Size",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<ProductSizeSelectionCubit, int>(
                  builder: (context, state) {
                    return Text(productEntity.sizes[state],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold));
                  },
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
