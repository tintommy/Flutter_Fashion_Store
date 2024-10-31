import 'package:ecommerce_app/presentation/product_detail/bloc/product_quantity_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/theme/app_color.dart';
import '../../../domain/product/entity/product.dart';

class ProductQuantity extends StatelessWidget {
  const ProductQuantity(this.productEntity, {super.key});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            "Số lượng",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: context.read<ProductQuantityCubit>().decrement,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.darkPrimary),
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 10),
              BlocBuilder<ProductQuantityCubit, int>(
                builder: (context, state) {
                  return Text(
                    state.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  );
                },
              ),
              SizedBox(width: 10),
              InkWell(
                onTap: context.read<ProductQuantityCubit>().increment,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.darkPrimary),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
    ;
  }
}
