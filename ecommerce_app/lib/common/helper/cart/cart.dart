import 'package:ecommerce_app/domain/order/entity/product_ordered.dart';

class CartHelper {
  static num calculateCartSubTotal(List<ProductOrderedEntity> products) {
    num subTotalPrice = 0;
    for (var item in products) {
      subTotalPrice = subTotalPrice + item.totalPrice;
    }
    return subTotalPrice;
  }
}
