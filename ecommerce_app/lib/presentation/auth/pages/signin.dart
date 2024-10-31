import 'package:ecommerce_app/common/bloc/button/button_cubit.dart';
import 'package:ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/common/widgets/buttons/basic_app_button.dart';
import 'package:ecommerce_app/common/widgets/buttons/basic_reactive_button.dart';
import 'package:ecommerce_app/data/auth/models/user_signin_req.dart';
import 'package:ecommerce_app/domain/auth/usecases/signin.dart';
import 'package:ecommerce_app/presentation/auth/pages/forgot_pass.dart';
import 'package:ecommerce_app/presentation/auth/pages/signup.dart';
import 'package:ecommerce_app/presentation/home/pages/home.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool _isObscure = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => ButtonCubit(),
        child: Scaffold(
          appBar: const BasicAppbar(
            hideBack: true,
          ),
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
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Đăng nhập thành công"),
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating));
                  AppNavigator().pushAndRemoveUntil(context, HomePage());
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
                      height: 15,
                    ),
                    _passField(),
                    SizedBox(height: 5),
                    _forgotPass(context),
                    SizedBox(
                      height: 10,
                    ),
                    _loginButton(context),
                    SizedBox(
                      height: 10,
                    ),
                    _signUpText(context),
                    Spacer(),
                    _signInGoogle(context),
                    SizedBox(
                      height: 30,
                    )
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
      "Đăng nhập",
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Widget _emailField() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Hãy nhập email";
        }
        return null;
      },
      controller: _emailController,
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

  void suffixTap() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  Widget _passField() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Hãy nhập mật khẩu";
        }
        return null;
      },
      controller: _passwordController,
      obscureText: _isObscure,
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: suffixTap,
              icon: _isObscure
                  ? Icon(Icons.visibility)
                  : Icon(Icons.visibility_off)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white, width: 2)),
          filled: true,
          labelText: "Mật khẩu",
          labelStyle: TextStyle(
              backgroundColor: Colors.transparent, color: Colors.white)),
    );
  }

  Widget _forgotPass(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator().push(context, ForgotPass());
      },
      child: Text(
        "Bạn quên mật khẩu?",
        textAlign: TextAlign.right,
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicReactiveButton(() {
        if (_formKey.currentState!.validate()) {
          UserSignInReq user =
              UserSignInReq(_emailController.text, _passwordController.text);

          context
              .read<ButtonCubit>()
              .execute(usecase: SignInUseCase(), params: user);
        }
      }, "Đăng nhập", null);
    });
  }

  Widget _signUpText(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator().push(context, SignupPage());
      },
      child: Text(
        "Đăng ký ?",
        textAlign: TextAlign.left,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _signInGoogle(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade400),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Đăng nhập bằng Google",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Image.asset(
              "assets/images/google.png",
              fit: BoxFit.cover,
              height: 40,
            )
          ],
        ));
  }
}
