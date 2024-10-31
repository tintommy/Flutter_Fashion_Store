import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/auth/models/user_creation_req.dart';
import 'package:ecommerce_app/data/auth/models/user_signin_req.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(UserCreationReq user);

  Future<Either> signIn(UserSignInReq user);

  Future<Either> sendPasswordResetEmail(String email);

  Future<Either> getAges();

  Future<bool> isLoggedIn();

  Future<Either> getUser();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signup(UserCreationReq user) async {
    try {
      var returnedData = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: user.email!, password: user.password!);
      FirebaseFirestore.instance
          .collection("User")
          .doc(returnedData.user!.uid)
          .set({
        "userId":returnedData.user!.uid,
        "firstName": user.firstName,
        "lastName": user.lastName,
        "email": user.email,
        "gender": user.gender,
        "age": user.age,
      });
      return Right("Sign up was successfull");
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == "weak-password") {
        message = "Weak password";
      } else if (e.code == "email-already-in-use") {
        message = "An account already exist with that email";
      }

      return Left(message);
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      var returnedData =
          await FirebaseFirestore.instance.collection("Ages").get();
      return Right(returnedData.docs);
    } catch (e) {
      return const Left("Please try again");
    }
  }

  @override
  Future<Either> signIn(UserSignInReq user) async {
    try {
      var returnedData = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user.email!, password: user.password!);
      return Right("Sign in was successfull");
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == "invalid-email") {
        message = "Not user found for that email";
      } else if (e.code == "invalid-credential") {
        message = "Wrong password";
      }

      return Left(message);
    }
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return Right("Send email successfull");
    } on FirebaseAuthException catch (e) {
      return Left("Plaese try again");
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<Either> getUser() async {
    try {
      var currentUser =  FirebaseAuth.instance.currentUser;
      var userData = await FirebaseFirestore.instance
          .collection("User")
          .doc(currentUser?.uid)
          .get().then((value)=> value.data());
      return Right(userData);
    } catch (e) {
     return Left("Please try again");
    }
  }
}
