import 'package:ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/core/configs/theme/app_color.dart';
import 'package:ecommerce_app/presentation/auth/pages/signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordResetEmail extends StatelessWidget {
  String email = "";

  PasswordResetEmail(this.email);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: BasicAppbar(hideBack: false),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/send_mail.png",
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "Email đã được gửi tới ${email}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        AppNavigator()
                            .pushAndRemoveUntil(context, SigninPage());
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            color: AppColors.darkPrimary,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          textAlign: TextAlign.center,
                          "Trở về trang đăng nhập",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
