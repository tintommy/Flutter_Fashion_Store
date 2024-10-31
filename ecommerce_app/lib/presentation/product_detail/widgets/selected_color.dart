import 'package:ecommerce_app/common/helper/bottomsheet/app_bottomsheet.dart';
import 'package:ecommerce_app/domain/product/entity/product.dart';
import 'package:ecommerce_app/presentation/product_detail/bloc/product_color_selection_cubit.dart';
import 'package:ecommerce_app/presentation/product_detail/widgets/product_color.dart';
import 'package:ecommerce_app/presentation/product_detail/widgets/product_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/theme/app_color.dart';

class SelectedColor extends StatelessWidget {
  const SelectedColor({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomSheet.display(context, BlocProvider.value(
          value: BlocProvider.of<ProductColorSelectionCubit>(context),
          child: ProductColor(productEntity: productEntity),
        ));
      },

      child: Container(
        height: 60,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColors.darkSecondBackground),
        child: BlocBuilder<ProductColorSelectionCubit, int>(
          builder: (context, state) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  productEntity.colors[state].title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Color(int.parse(productEntity.colors[state].hexCode
                              .replaceFirst('#', '0xFF'))),
                          shape: BoxShape.circle),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    )
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
    ;
  }
}
