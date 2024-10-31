import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_color.dart';

class MyOrdersTile extends StatelessWidget {
  const MyOrdersTile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(color: AppColors.darkSecondBackground,
        borderRadius: BorderRadius.circular(10)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Đơn hàng của tôi", style: TextStyle(fontSize: 18),),
        Icon(Icons.chevron_right_outlined)
      ],
    ),
    );
  }
}
