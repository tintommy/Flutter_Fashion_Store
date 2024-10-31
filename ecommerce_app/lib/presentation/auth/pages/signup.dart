import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/data/auth/models/user_creation_req.dart';
import 'package:ecommerce_app/presentation/auth/pages/gender_and_age_selection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/helper/navigator/app_navigator.dart';
import '../../../common/widgets/buttons/basic_app_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isObscure = true;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const BasicAppbar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _signinText(context),
              SizedBox(
                height: 10,
              ),
              _firstNameField(),
              SizedBox(
                height: 10,
              ),
              _lastNameField(),
              SizedBox(
                height: 10,
              ),
              _emailField(),
              SizedBox(
                height: 15,
              ),
              _passField(),
              SizedBox(
                height: 10,
              ),
              _loginButton(context),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return Text(
      "Tạo tài khoản",
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Widget _emailField() {
    return TextField(
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

  Widget _firstNameField() {
    return TextField(
      controller: _firstNameController,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white, width: 2)),
          labelText: "Họ",
          labelStyle: TextStyle(
              backgroundColor: Colors.transparent, color: Colors.white)),
    );
  }

  Widget _lastNameField() {
    return TextField(
      controller: _lastNameController,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white, width: 2)),
          labelText: "Tên",
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
    return TextField(
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

  Widget _loginButton(BuildContext context) {
    return BasicAppButton(() {
      AppNavigator().push(
          context,
          GenderAndAgeSelection(
            userCreationReq: UserCreationReq(
                _firstNameController.text,
                _lastNameController.text,
                _emailController.text,
                _passwordController.text
               ),
          ));
    }, "Tiếp tục", null);
  }
}
