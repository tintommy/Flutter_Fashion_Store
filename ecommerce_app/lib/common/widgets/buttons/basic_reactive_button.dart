import 'package:ecommerce_app/common/bloc/button/button_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasicReactiveButton extends StatelessWidget {
  BasicReactiveButton(this.onPressed, this.title, this.height);

  final VoidCallback onPressed;
  final String title;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonCubit, ButtonState>(
      builder: (context, state) {
        if (state is ButtonLoadingState) {
          return _loading();
        }

        return _initial();
      },
    );
  }

  Widget _loading() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(height ?? 50)),
        onPressed: onPressed,
        child: Container(
            height: height??50,
            child: Center(child: CircularProgressIndicator())));
  }

  Widget _initial() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(height ?? 50)),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ));
  }
}
