import 'package:ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_app/core/configs/theme/app_color.dart';
import 'package:ecommerce_app/domain/auth/entity/user.dart';
import 'package:ecommerce_app/presentation/cart/pages/cart.dart';
import 'package:ecommerce_app/presentation/cart/pages/order_placed.dart';
import 'package:ecommerce_app/presentation/home/bloc/user_info_display_cubit.dart';
import 'package:ecommerce_app/presentation/settings/pages/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
        ),
      ],
      child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
        builder: (context, state) {
          if (state is UserInfoLoading) {
            return CircularProgressIndicator();
          }
          if (state is UserInfoLoaded) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: (){
                      AppNavigator().push(context, SettingsPage());
                    },
                    child: _profileImage(state.user)),
                _gender(state.user),
                GestureDetector(
                    onTap: () {
                      AppNavigator().push(context, CartPage());

                      //AppNavigator().push(context, OrderPlacedPage());
                    },
                    child: _cart())
              ],
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }

  Widget _profileImage(UserEntity user) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
          image: DecorationImage(
              image: user.image != ""
                  ? NetworkImage(user.image)
                  : AssetImage("assets/images/no_avatar.jpg"),
              fit: BoxFit.cover)),
    );
  }

  Widget _gender(UserEntity user) {
    return Container(
      height: 40,
      width: 70,
      child: Center(
          child: Text(
        user.gender == 0 ? "Nữ" : "Nam",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      decoration: BoxDecoration(
          color: AppColors.darkSecondBackground,
          borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget _cart() {
    return Container(
      width: 40,
      height: 40,
      child: Icon(Icons.shopping_cart),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.darkPrimary,
      ),
    );
  }
}
