import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/presentation/home/widgets/header.dart';
import 'package:ecommerce_app/presentation/home/widgets/new_in.dart';
import 'package:ecommerce_app/presentation/home/widgets/search_field.dart';
import 'package:ecommerce_app/presentation/home/widgets/top_selling.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/helper/navigator/app_navigator.dart';
import '../../../core/configs/theme/app_color.dart';
import '../../../data/product/models/color.dart';
import '../../../data/product/models/product.dart';
import '../../search/pages/search.dart';
import '../widgets/categories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // var sv = ProductService();
    // sv.addProductToFirebase();
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Header(),
              SizedBox(
                height: 20,
              ),
              SearchField(),
              SizedBox(
                height: 20,
              ),
              Categories(),
              SizedBox(
                height: 15,
              ),
              TopSelling(),
              SizedBox(
                height: 20,
              ),
              NewIn()
            ],
          ),
        ),
      ),
    ));
  }
}

// class ProductService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   Future<void> addProduct(ProductModel product) async {
//     try {
//       await _firestore.collection('Products').add(product.toJson());
//       print("Product added successfully!");
//     } catch (e) {
//       print("Error adding product: $e");
//     }
//   }
//
//   void addProductToFirebase() async {
//     ProductModel product = ProductModel(
//       "XBUY1hlxdVqqFAgiK2Hr",
//       [
//         ProductColorModel("Black", "#000000"),
//         ProductColorModel("Blue", "#0000FF"),
//       ],
//       Timestamp.now(),
//       500.0,
//       1,
//       ["https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/a12a1e20-18d2-480e-bb30-85a4c213a161/AIR+FORCE+1+%2707+LV8+1.png",
// "https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/3f3e7049-5c99-428c-abcd-e246b086f2ed/AIR+FORCE+1+%2707.png"
//       ],
//       450.0,
//       ["S", "M", "L"],
//       "productIdExample",
//       30,
//       " Nike Shoes",
//     );
//
//     ProductService productService = ProductService();
//     await productService.addProduct(product);
//   }
// }
