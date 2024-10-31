import 'package:ecommerce_app/core/configs/theme/app_color.dart';
import 'package:ecommerce_app/domain/product/entity/product.dart';
import 'package:ecommerce_app/presentation/product_detail/bloc/favorite_icon_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.product});
final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<FavoriteIconCubit>().onTap(product);
        },
        icon: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.darkBackground,
            shape: BoxShape.circle,
          ),
          child: BlocBuilder<FavoriteIconCubit, bool>(
            builder: (context, state) {
              return Icon(
                Icons.favorite,
                size: 15,
                color: state ? Colors.red : Colors.white,
              );
            },
          ),
        ));
  }
}
