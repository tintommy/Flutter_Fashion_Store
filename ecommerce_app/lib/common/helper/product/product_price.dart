import 'package:ecommerce_app/domain/product/entity/product.dart';

class ProductPriceHelper{
  num provideCurrentPrice(ProductEntity product){
    return product.discountedPrice != 0 ?  product.discountedPrice:product.price;
  }
}