import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/add_to_cart_request.dart';
import '../models/order_registration_req.dart';

abstract class OrderFirebaseService {
  Future<Either> addToCart(AddToCartReq addToCartReq);

  Future<Either> getCartProduct();

  Future<Either> removeCartProduct(String id);

  Future<Either> orderRegistration(OrderRegistrationReq order);
}

class OrderFirebaseServiceImp extends OrderFirebaseService {
  @override
  Future<Either> addToCart(AddToCartReq addToCartReq) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      FirebaseFirestore.instance
          .collection("User")
          .doc(user!.uid)
          .collection("Cart")
          .add(addToCartReq.toJson());

      return Right("Add to cart was successfully");
    } catch (e) {
      return Left("Please try again");
    }
  }

  @override
  Future<Either> getCartProduct() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var returnedData = await FirebaseFirestore.instance
          .collection("User")
          .doc(user!.uid)
          .collection("Cart")
          .get();

      List<Map> products = [];
      for (var item in returnedData.docs) {
        var data = item.data();
        data.addAll({"id": item.id});
        products.add(data);
      }
      return Right(products);
    } catch (e) {
      return const Left("Please try again");
    }
  }

  @override
  Future<Either> removeCartProduct(String id) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection("User")
          .doc(user!.uid)
          .collection("Cart")
          .doc(id)
          .delete();
      return Right("Product removed successfully");
    } catch (e) {
      return const Left("Please try again");
    }
  }

  @override
  Future<Either> orderRegistration(OrderRegistrationReq order) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection("User")
          .doc(user!.uid)
          .collection("Order")
          .add(order.toJson());
      return Right("Add order successfully");
    } catch (e) {
      return const Left("Please try again");
    }
  }
}
