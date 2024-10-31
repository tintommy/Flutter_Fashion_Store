import '../../../core/constants/app_urls.dart';

class ImageDisplayHelper {
  String generateCategoryImageURL(String title) {
    return AppUrl.categoryImage + title + AppUrl.alt;
  }
}
