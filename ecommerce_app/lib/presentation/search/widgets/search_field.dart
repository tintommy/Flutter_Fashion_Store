import 'package:ecommerce_app/common/bloc/product/products_display_cubit.dart';
import 'package:ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_app/common/widgets/buttons/basic_reactive_button.dart';
import 'package:ecommerce_app/core/configs/theme/app_color.dart';
import 'package:ecommerce_app/presentation/search/pages/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value){
        if(value.isEmpty){
          context.read<ProductsDisplayCubit>().displayInit();
        }else{
          context.read<ProductsDisplayCubit>().displayProducts(params: value);}
      },
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30),),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.white24),
          fillColor: AppColors.darkSecondBackground),
    );
  }
}
