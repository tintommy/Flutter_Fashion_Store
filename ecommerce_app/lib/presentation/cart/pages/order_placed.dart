import 'package:ecommerce_app/core/configs/theme/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderPlacedPage extends StatelessWidget {
  const OrderPlacedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.darkPrimary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
              child: Image.asset(
            "assets/images/order_success.png",
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          )),
          SizedBox(
            height: 60,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            padding: EdgeInsets.all(50),
            decoration: BoxDecoration(
                color: AppColors.darkSecondBackground,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            child: Column(
              children: [
                Text(
                  "Đặt hàng thành công",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Bạn sẽ nhận được email xác nhận",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                Spacer(),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Xem chi tiết đơn hàng",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400))),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
