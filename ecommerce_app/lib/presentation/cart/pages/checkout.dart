import 'dart:ffi';

import 'package:ecommerce_app/common/bloc/button/button_cubit.dart';
import 'package:ecommerce_app/common/helper/cart/cart.dart';
import 'package:ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/common/widgets/buttons/basic_app_button.dart';
import 'package:ecommerce_app/data/order/models/order_registration_req.dart';
import 'package:ecommerce_app/domain/order/entity/product_ordered.dart';
import 'package:ecommerce_app/domain/order/usecases/order_registration.dart';
import 'package:ecommerce_app/presentation/cart/pages/order_placed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutPage extends StatelessWidget {
  CheckoutPage({super.key, required this.products, required this.total});

  final List<ProductOrderedEntity> products;
  final String total;

  TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonCubit(),
      child: SafeArea(
          child: Scaffold(
        appBar: BasicAppbar(title: Text("Đặt hàng")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _addAddressFiled(_addressController),
            Padding(
              padding: EdgeInsets.all(20),
              child: Builder(builder: (context) {
                return BlocConsumer<ButtonCubit, ButtonState>(
                  builder: (context, state) {
                    if (state is ButtonInitial )
                      return ElevatedButton(
                          onPressed: () {
                            context.read<ButtonCubit>().execute(
                                usecase: OrderRegistrationUseCase(),
                                params: OrderRegistrationReq(
                                    products,
                                    DateTime.now().toString(),
                                    products.length,
                                    CartHelper.calculateCartSubTotal(products)
                                        .toDouble(),
                                    _addressController.text));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                total,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15),
                              ),
                              Text("Đặt hàng",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontSize: 15))
                            ],
                          ));




                    if (state is ButtonLoadingState)
                      return Center(
                        child: CircularProgressIndicator(),
                      );

                    return SizedBox.shrink();
                  },listener: (context,state){
                  if(state is ButtonSuccessState)
                    AppNavigator().pushReplacement(context, OrderPlacedPage());
                },
                );
              }),
            )
          ],
        ),
      )),
    );
  }
}

Widget _addAddressFiled(TextEditingController _controller) {
  return Padding(
    padding: EdgeInsets.all(20),
    child: TextField(
      controller: _controller,
      minLines: 2,
      maxLines: 4,
      decoration: InputDecoration(hintText: "Địa chỉ"),
    ),
  );
}
