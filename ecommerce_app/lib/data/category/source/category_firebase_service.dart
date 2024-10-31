import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryFirebaseService {
  Future<Either> getCategories();
}

class CategoryFirebaseServiceImpl implements CategoryFirebaseService {
  @override
  Future<Either> getCategories() async {
    try {
      var returnedData =
          await FirebaseFirestore.instance.collection("Categories").get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left("Please try again");
    }
  }
}
