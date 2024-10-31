import 'package:ecommerce_app/presentation/product_detail/bloc/product_color_selection_cubit.dart';
import 'package:ecommerce_app/presentation/product_detail/bloc/product_size_selection_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/theme/app_color.dart';
import '../../../domain/product/entity/product.dart';

class ProductColor extends StatelessWidget {
  const ProductColor({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.darkBackground,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Text(
            "Màu sắc",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return BlocBuilder<ProductColorSelectionCubit, int>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<ProductColorSelectionCubit>()
                              .itemSelection(index);
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 60,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: state == index
                                  ? AppColors.darkPrimary
                                  : AppColors.darkSecondBackground),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                              "Màu sắc",
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
                                    color: Color(int.parse(productEntity.colors[index].hexCode
                                        .replaceFirst('#', '0xFF'))),
                                    shape: BoxShape.circle),
                              )
                                  ,
                                  SizedBox(width: 10),
                                  state == index
                                      ? Icon(
                                          Icons.done,
                                          color: Colors.white,
                                        )
                                      : SizedBox(width: 30,)
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemCount: productEntity.colors.length),
          )
        ],
      ),
    );
  }
}
