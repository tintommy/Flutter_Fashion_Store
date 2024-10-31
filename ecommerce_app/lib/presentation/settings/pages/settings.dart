import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/core/configs/theme/app_color.dart';
import 'package:ecommerce_app/presentation/settings/widgets/my_favorites_tile.dart';
import 'package:ecommerce_app/presentation/settings/widgets/my_orders_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: BasicAppbar(
        title: Text(
          "Cài Đặt",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            MyFavoritesTile(),
            SizedBox(height: 10,),
            MyOrdersTile()
          ],
        ),
      ),
    ));
  }
}
