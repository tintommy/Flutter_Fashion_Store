import 'package:ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_app/core/configs/theme/app_color.dart';
import 'package:ecommerce_app/presentation/settings/pages/my_favorites.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFavoritesTile extends StatelessWidget {
  const MyFavoritesTile({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        AppNavigator().push(context, MyFavoritesPage());
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(color: AppColors.darkSecondBackground,
        borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Yêu thích của tôi", style: TextStyle(fontSize: 18),),
            Icon(Icons.chevron_right_outlined)
          ],
        ),
      ),
    );
  }
}
