import 'package:ecommerce_app/common/bloc/button/button_cubit.dart';
import 'package:ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/common/widgets/buttons/basic_app_button.dart';
import 'package:ecommerce_app/common/widgets/buttons/basic_reactive_button.dart';
import 'package:ecommerce_app/domain/auth/usecases/reset_pass.dart';
import 'package:ecommerce_app/presentation/auth/pages/password_reset_email.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => ButtonCubit(),
        child: Scaffold(
          appBar: const BasicAppbar(),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: BlocListener<ButtonCubit, ButtonState>(
              listener: (context, state) {
                if (state is ButtonFailureState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.errorMessage),
                      behavior: SnackBarBehavior.floating));
                }
                if (state is ButtonSuccessState) {
                  AppNavigator()
                      .push(context, PasswordResetEmail(_emailController.text));
                }
              },
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _signinText(context),
                    SizedBox(
                      height: 10,
                    ),
                    _emailField(),
                    SizedBox(
                      height: 10,
                    ),
                    _continueButton(context)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return Text(
      "Quên mật khẩu",
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Widget _emailField() {
    return TextFormField(
      controller: _emailController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Hãy nhập email";
        }
        return null;
      },
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white, width: 2)),
          labelText: "Email",
          labelStyle: TextStyle(
              backgroundColor: Colors.transparent, color: Colors.white)),
    );
  }

  Widget _continueButton(BuildContext context) {
    return  Builder(builder: (context) {
      return BasicReactiveButton(() {
        if (_formKey.currentState!.validate()) {
          context.read<ButtonCubit>().execute(
              usecase: ResetPassUseCase(), params: _emailController.text);
        }
      }, "Tiếp tục", null);
    });
  }
}
